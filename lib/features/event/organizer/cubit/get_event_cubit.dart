import 'package:alafein/core/api/constants/endpoints.dart';
import 'package:alafein/core/api/constants/methods.dart';
import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/data/model/event_datils/event_deatils_model/event_deatils_model.dart';
import 'package:alafein/features/event/data/model/events/events.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/api/api_caller.dart';

class GetEventCubit extends Cubit<GetEventState> {
  GetEventCubit() : super(GetEventStateInital());

  final APICaller _apiCaller = APICaller.instance;
  Events? event;
  List<Events> events = [];

  Future<void> getEventPagination() async {
    EasyLoading.show();
    final call = await _apiCaller.call(
        endpoint: Endpoints.getPagination,
        method: APIMethods.get,
        queryParameters: {"PageNumber": 1, "PageSize": 500},
        options: Options(headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        }));
    call.fold(
      (failure) {
        if (SessionManagement.getUserRole() != "") {
          EasyLoading.showError(failure.toString());
        }else {
        }
      },
      (response) {
        if (response.succeeded == true) {
          for (var element in response.data) {
            event = Events.fromJson(element);
            events.add(event!);
            emit(ScafullGetEventState());
          }
          EasyLoading.dismiss();
        } else {
          if (SessionManagement.getUserRole() != "") {
            EasyLoading.showError(response.message ?? "Error !");
          }
          emit(ErrorGetEventState(response.message ?? "Error !"));
        }
      },
    );
  }

  EventDeatilsModel? eventDetails;
  List<EventDeatilsModel> eventDetailsList = [];

  Future<void> getEventDeatils({required int id}) async {
    EasyLoading.show();
    final call = await _apiCaller.call(
        endpoint: "${Endpoints.eventDetails}/$id",
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
          eventDetails = EventDeatilsModel.fromJson(response.data);
          EasyLoading.dismiss();
          emit(ScafullGetEventDEatilsState());
        } else {
          EasyLoading.showError(response.message ?? "Error !");
          emit(ErrorGetEventDEatilsState(response.message ?? "Error !"));
        }
      },
    );
  }
}
