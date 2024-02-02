import 'package:alafein/core/api/api_caller.dart';
import 'package:alafein/core/api/constants/endpoints.dart';
import 'package:alafein/core/api/constants/methods.dart';
import 'package:alafein/core/debugging/log.dart';
import 'package:alafein/features/auth/signup/model/lookup_model.dart';
import 'package:alafein/features/auth/signup/model/registration_organizer_model.dart';
import 'package:alafein/features/auth/signup/model/registration_user_model.dart';
import 'package:alafein/features/auth/signup/model/registration_venue_model.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/domain/days.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/signup_venue_branch_body.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final APICaller _apiCaller = APICaller.instance;
  bool isAuduence = true;
  bool isEventHost = false;
  bool isVenue = false;
  bool isEventOrganiser = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyOrganizer = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyVenue = GlobalKey<FormState>();
  List<GlobalKey<FormState>> keys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int branchIndex = 0;
  List<Branches> branches = [];
  List<Widget> branchesPages = [];
  List<List<Facility?>> selectedFacilities = [[], [], []];
  List<List<Days>> days = [
    [
      Days(
        name: "Saturday",
        id: 6,
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 0,
        name: "Sunday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 1,
        name: "Monday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 2,
        name: "Tuesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 3,
        name: "Wednesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 4,
        name: "Thursday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 5,
        name: "Friday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
    ],
    [
      Days(
        name: "Saturday",
        id: 6,
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 0,
        name: "Sunday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 1,
        name: "Monday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 2,
        name: "Tuesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 3,
        name: "Wednesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 4,
        name: "Thursday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 5,
        name: "Friday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
    ],
    [
      Days(
        name: "Saturday",
        id: 6,
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 0,
        name: "Sunday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 1,
        name: "Monday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 2,
        name: "Tuesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 3,
        name: "Wednesday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 4,
        name: "Thursday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
      Days(
        id: 5,
        name: "Friday",
        opening: null,
        closing: null,
        isOpen: false,
      ),
    ],
  ];

  String? branchesNum;
  String firstName = "",
      lastName = "",
      branchName = "",
      email = "",
      password = "",
      map = "",
      address = "",
      description = "",
      name = "",
      instagram = "",
      phone = "",
      facebook = "",
      website = "",
      other = "";
  Category? selectedCategory;
  late RegistrationUserModel _userModel;
  late RegistrationOrganizerModel _organizerModel;
  late RegistrationVenueModel _venueModel;
  LookupModel? _lookupModel;

  SignupCubit() : super(SignupStateInitial());

  void _setUserRole() {
    List<int>? branchFacilites = [];

    for (Facility? value in selectedFacilities[branchIndex] ?? []) {
      branchFacilites.add(value?.id ?? 1);
    }
    _userModel = RegistrationUserModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      profilePicture:
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHx8",
      roleId: "roleId",
    );
    _organizerModel = RegistrationOrganizerModel(
      mapLink: map,
      address: address,
      instagram: instagram,
      facebook: facebook,
      description: description,
      other: other,
      websiteURL: website,
      categoryId: selectedCategory?.id,
    );
    _venueModel = RegistrationVenueModel(
      venueName: name,
      phoneNumber: phone,
      photos: [
        "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHx8",
      ],
      instagram: instagram,
      facebook: facebook,
      other: other,
      websiteURL: website,
      branches: branches,
      venueFacilities: [1],
      venueDescription: description,
      categoryId: selectedCategory?.id,
    );
    for (Roles? element in _lookupModel?.roles ?? []) {
      if (isAuduence) {
        if (element?.name == "Audience") {
          _userModel.roleId = element?.id ?? "roleId";
        }
      } else {
        if (element?.name == "Host Venue") {
          _userModel.roleId = element?.id ?? "roleId";
        }
      }
    }
  }

  Map<String, dynamic> _signupData() {
    if (isEventHost == false) {
      return {
        "user": _userModel.toJson(),
        "organizer": null,
        "venue": null,
      };
    } else if (isEventOrganiser == true) {
      return {
        "user": _userModel.toJson(),
        "organizer": _organizerModel,
        "venue": null,
      };
    } else {
      return {
        "user": _userModel.toJson(),
        "organizer": null,
        "venue": _venueModel.toJson(),
      };
    }
  }

  Future<void> getLookup() async {
    EasyLoading.show();
    final call = await _apiCaller.call(
        endpoint: Endpoints.lookup, method: APIMethods.get);
    call.fold(
      (failure) {
        emit(SignupStateError(message: "Error !"));
        EasyLoading.showError(failure);
      },
      (response) {
        Log.debug(response.succeeded);
        if (response.succeeded == true) {
          _lookupModel = LookupModel.fromJson(response.data);

          EasyLoading.dismiss();
        } else {
          EasyLoading.showError(response.message ?? "Error !");
          emit(SignupStateError(message: response.message ?? "Error !"));
        }
      },
    );
  }

  Future<void> signup() async {
    EasyLoading.show();
    _setUserRole();

    final call = await _apiCaller.call(
      endpoint: Endpoints.register,
      method: APIMethods.post,
      data: _signupData(),
    );
    call.fold(
      (failure) {
        EasyLoading.showError(failure.toString());

        emit(SignupStateError(message: "Error !"));
      },
      (response) {
        if (response.succeeded == true) {
          EasyLoading.dismiss();

          emit(SignupStateLoaded());
        } else {
          EasyLoading.showError(response.message ?? "Error !");
          emit(SignupStateError(message: response.message ?? "Error !"));
        }
      },
    );
  }

  void createBrances() {
    for (var i = 0; i < getBranchesNum; i++) {
      branches.add(Branches(workDays: []));
      branchesPages.add(const SignupVenueBranchBody());
    }
  }

  int get getBranchesNum {
    if (branchesNum != null) {
      return int.parse(branchesNum!);
    } else {
      return 0;
    }
  }

  void updateState() {
    emit(SignupStateInitial());
  }

  LookupModel? get lookupModel => _lookupModel;

  void saveBranchData() {
    branches[branchIndex].address = address;
    branches[branchIndex].mapLink = map;
    branches[branchIndex].name = branchName;
    for (Facility? facility in selectedFacilities[branchIndex]) {
      branches[branchIndex].branchFacilities?.add(facility?.id ?? 1);
    }
    for (Days day in days[branchIndex]) {
      branches[branchIndex].workDays?.add(WorkDays(
          id: day.id,
          from: _timeToString(day.opening),
          to: _timeToString(day.closing)));
    }
  }

  String _timeToString(TimeOfDay? time) {
    if (time != null) {
      return "${(time.hourOfPeriod.toString().padLeft(2, "0"))}:${(time.minute.toString().padLeft(2, "0"))} ${(time.hour > 12 ? "PM" : "AM")}";
    } else {
      return "";
    }
  }
}
