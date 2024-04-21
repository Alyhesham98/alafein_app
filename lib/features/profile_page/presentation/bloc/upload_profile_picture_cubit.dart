import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../core/api/api_caller.dart';
import '../../../../core/api/constants/endpoints.dart';
import '../../../../core/api/constants/methods.dart';
import '../../../../core/debugging/log.dart';
import '../../../../core/local_data/session_management.dart';

part 'upload_profile_picture_state.dart';

class UploadProfilePictureCubit extends Cubit<UploadProfilePictureState> {
  UploadProfilePictureCubit() : super(UploadProfilePictureInitial());

  final APICaller _apiCaller = APICaller.instance;



  Future<String?> uploadPosterImage(XFile? posterPhoto) async {

    if (posterPhoto != null) {
      emit(UploadProfilePictureLoading());
      EasyLoading.show();
      Log.info(posterPhoto.path);
      final call = await _apiCaller.call(
          endpoint: Endpoints.uploadProfilePic,
          options: Options(headers: {
            "Authorization": "Bearer ${SessionManagement.getUserToken()}"
          },contentType:" multipart/form-data"),
          method: APIMethods.post,
          data: FormData.fromMap({
            "image": await MultipartFile.fromFile(File(posterPhoto.path).path,
                contentType: MediaType("image",posterPhoto.path.split(".").last),
                filename: posterPhoto.name)
          }));
      call.fold(
            (l) => EasyLoading.showError(l),
            (r) {
          if (r.succeeded == true) {
            SessionManagement.saveUserImage(r.data??'');
            Log.info(r.data);
            EasyLoading.showInfo(r.message.toString());
            emit(UploadProfilePictureLoaded());
            EasyLoading.dismiss();
            return r.data;
          } else {
            EasyLoading.showError(r.message ?? "");
            emit(UploadProfilePictureError(message: r.errors!.join(",")));
          }
        },
      );
    }
    return null;
  }



  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     posterPhoto = pickedFile;
  //     emit(UploadProfilePictureInitial());
  //   }
  // }



}
