
import 'package:alafein/core/api/api_caller.dart';
import 'package:alafein/core/api/constants/endpoints.dart';
import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/create_event/model/fav_toggle_request.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/api/constants/methods.dart';

part 'toggle_fav_state.dart';

class ToggleFavCubit extends Cubit<ToggleFavState> {
  ToggleFavCubit() : super(ToggleFavInitial());
  final APICaller _apiCaller = APICaller.instance;

  final FavToggleRequest _favToggleRequest = FavToggleRequest(submissionId: 0);

  Future<void> favToggle(int id) async {
    EasyLoading.show();
    _favToggleRequest.submissionId = id;
    final call = await _apiCaller.call(
        endpoint: Endpoints.favToggle,
        method: APIMethods.post,
        data: _favToggleRequest.toMap(),
        options: Options(headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        }));
    call.fold(
      (failure) {
        EasyLoading.showError(failure.toString());
        emit(ToggleFavError(message: "Error !"));
      },
      (response) {
        if (response.succeeded == true) {
          EasyLoading.dismiss();
          emit(ToggleFavSuccessed(isFav: response.data));
        } else {
          EasyLoading.showError(response.message ?? "Error !");

          emit(ToggleFavError(message: response.message ?? "Error !"));
        }
      },
    );
  }
}
