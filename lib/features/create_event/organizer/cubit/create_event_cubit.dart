import 'dart:io';

import 'package:alafein/core/api/api_caller.dart';
import 'package:alafein/core/api/constants/endpoints.dart';
import 'package:alafein/core/debugging/log.dart';
import 'package:alafein/core/local_data/session_management.dart';
// import 'package:alafein/features/auth/signup/model/lookup_model.dart';
import 'package:alafein/features/create_event/model/create_event_request.dart';
import 'package:alafein/features/create_event/model/dropdown_response/attendance.dart';
import 'package:alafein/features/create_event/model/dropdown_response/branch.dart';
import 'package:alafein/features/create_event/model/dropdown_response/dropdown_response.dart';
import 'package:alafein/features/create_event/model/dropdown_response/repeat.dart';
import 'package:alafein/features/create_event/model/dropdown_response/venue.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/constants/methods.dart';
import '../../model/dropdown_response/category.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventInitial());
  final APICaller _apiCaller = APICaller.instance;

  final List<GlobalKey<FormState>> keys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  CreateEventRequest _createEventRequest = CreateEventRequest(
    eventNameEn: "eventNameEn",
    eventNameAr: "eventNameAr",
    eventDescriptionEn: "eventDescriptionEn",
    eventDescriptionAr: "eventDescriptionAr",
    mainArtestNameEn: "mainArtestNameEn",
    mainArtestNameAr: "mainArtestNameAr",
    kidsAvailability: false,
    attendanceOption: 0,
    url: "url",
    paymentFee: 0,
    poster: "poster",
    contactPerson: "contactPerson",
    addtionalComment: "addtionalComment",
    categoryId: 0,
    venueId: 0,
    branchId: 0,
    repeat: 0,
    dates: [],
  );

  DropdownResponse _dropdownResponse = DropdownResponse();
  Category? _selectedCategory;
  Repeat? _selectedRepeat;
  Branch? _selectedBranch;

  Venue? _selectedVenue;
  DateTime? _selectedDate;
  XFile? posterPhoto;

  Attendance? _selecteAttendance;

  void checkForKids(bool value) {
    _createEventRequest.kidsAvailability = value;
    emit(CreateEventInitial());
  }

  int index = 0;
  final pageController = PageController(initialPage: 0);

  String? nameFiledValediator(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid name';
    } else if (value.length < 3) {
      return "Too Short";
    }
    return null;
  }

  String? descriptionFiledValediator(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid Description';
    }
    return null;
  }

  String? textValediator(String value) {
    if (value.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  Future<void> next() async {
    if (keys[index].currentState!.validate() && _validateDropdowns()) {
      if (index < 2) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
        index++;
        emit(CreateEventInitial());
      } else {
        _createEventRequest.poster = await uploadPosterImage() ?? "image";
        await createEvent();
      }
    } else {
      EasyLoading.showError("Complete Data");
    }
  }

  bool _validateDropdowns() {
    if (index == 0) {
      if (_selectedCategory == null) {
        return false;
      } else {
        return true;
      }
    } else if (index == 1) {
      if (_selectedVenue == null ||
          _selectedBranch == null ||
          selectedDate == null ||
          _selectedRepeat == null) {
        return false;
      } else {
        return true;
      }
    } else {
      if (_selecteAttendance == null || posterPhoto == null) {
        return false;
      } else {
        return true;
      }
    }
  }

  Future<String?> uploadPosterImage() async {
    if (posterPhoto != null) {
      emit(CreateEventLoading());
      EasyLoading.show();
      Log.info(posterPhoto!.path);
      final call = await _apiCaller.call(
          endpoint: Endpoints.uploadEventPoster,
          method: APIMethods.post,
          options: Options(headers: {
            "Authorization": "Bearer ${SessionManagement.getUserToken()}"
          }),
          data: FormData.fromMap({
            "image": await MultipartFile.fromFile(File(posterPhoto!.path).path,
                filename: posterPhoto!.name)
          }));
      call.fold(
        (l) => EasyLoading.showError(l),
        (r) {
          if (r.succeeded == true) {
            Log.info(r.data["Data"]);
            return r.data["Data"];
          } else {
            EasyLoading.showError(r.message ?? "");
          }
        },
      );
    }
  }

  Future<void> getDropdowns() async {
    EasyLoading.show();
    final call = await _apiCaller.call(
        endpoint: Endpoints.getEventDropdowns,
        method: APIMethods.get,
        options: Options(headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        }));
    call.fold(
      (failure) {
        EasyLoading.showError(failure.toString());
      },
      (response) {
        if (response.succeeded == true) {
          _dropdownResponse = DropdownResponse.fromMap(response.data);
          EasyLoading.dismiss();

          emit(CreateEventInitial());
        } else {
          EasyLoading.showError(response.message ?? "Error !");
        }
      },
    );
  }

  Future<void> createEvent() async {
    EasyLoading.show();
    _createEventRequest.branchId = _selectedVenue?.branch?[0].id ?? 5;
    final call = await _apiCaller.call(
        endpoint: Endpoints.createEvent,
        method: APIMethods.post,
        data: _createEventRequest.toMap(),
        options: Options(headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        }));
    call.fold(
      (failure) {
        EasyLoading.showError(failure.toString());
        emit(CreateEventError(message: "Error !"));
      },
      (response) {
        if (response.succeeded == true) {
          EasyLoading.dismiss();

          emit(CreateEventSuccessed());
        } else {
          EasyLoading.showError(response.message ?? "Error !");

          emit(CreateEventError(message: response.message ?? "Error !"));
        }
      },
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      posterPhoto = pickedFile;
      emit(CreateEventInitial());
    }
  }

  bool get isForKids => _createEventRequest.kidsAvailability;
  DropdownResponse get dropdownResponse => _dropdownResponse;
  Repeat? get selectedRepeat => _selectedRepeat;
  Venue? get selectedVenue => _selectedVenue;
  Branch? get selectedBranch => _selectedBranch;
  DateTime? get selectedDate => _selectedDate;
  Attendance? get selecteAttendance => _selecteAttendance;
  Category? get selectedCategory => _selectedCategory;
  set saveEventNameEN(String value) => _createEventRequest.eventNameEn;
  set saveEventNameAR(String value) => _createEventRequest.eventNameAr;
  set saveEventDescriptionEn(String value) =>
      _createEventRequest.eventDescriptionEn;
  set saveEventDescriptionAr(String value) =>
      _createEventRequest.eventDescriptionAr;
  set saveMainArtestNameEn(String value) =>
      _createEventRequest.mainArtestNameEn;
  set saveMainArtestNameAr(String value) =>
      _createEventRequest.mainArtestNameAr;
  set saveUrl(String value) => _createEventRequest.url;
  set savePoster(String value) => _createEventRequest.poster;
  set saveContactPerson(String value) => _createEventRequest.contactPerson;
  set saveAddtionalComment(String value) =>
      _createEventRequest.addtionalComment;
  set saveFees(String value) => _createEventRequest.paymentFee;
  set saveCategory(Category? value) {
    _selectedCategory = value;
    _createEventRequest.categoryId = value?.id ?? 1;
    emit(CreateEventInitial());
  }

  set saveRepeat(Repeat? value) {
    _selectedRepeat = value;
    _createEventRequest.repeat = value?.id ?? 1;
    emit(CreateEventInitial());
  }

  set saveAttendance(Attendance? value) {
    _selecteAttendance = value;
    _createEventRequest.attendanceOption = value?.id ?? 1;
    emit(CreateEventInitial());
  }

  set saveVenue(Venue? value) {
    _selectedVenue = value;
    _createEventRequest.venueId = value?.id ?? 1;
    emit(CreateEventInitial());
  }

  set saveBranch(Branch? value) {
    _selectedBranch = value;
    _createEventRequest.branchId = value?.id ?? 1;
    emit(CreateEventInitial());
  }

  set saveDate(DateTime? value) {
    _selectedDate = value;
    _createEventRequest.dates.add(value?.toIso8601String() ?? "");
    emit(CreateEventInitial());
  }
}
