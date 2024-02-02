import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../core/debugging/log.dart';

part 'images_selection_state.dart';

class ImagesSelectionCubit extends Cubit<ImagesSelectionState> {
  ImagesSelectionCubit() : super(ImagesSelectionInitial());

  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  List<XFile> imagesList = [];
  List upImagesFiles = [];

  void onImagePickerClicked() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      imageFile = null;
      imageFile = pickedFile!;
      imagesList.add(imageFile!);
      getMultiFiles();
      emit(ImagesSelectionPhotoUpdated());
    } catch (e) {
      Log.error(e.toString());
    }
  }

  Future<List> getMultiFiles() async {
    for (int i = 0; i < imagesList.length; i++) {
      upImagesFiles.add(MultipartFile.fromFileSync(
        imagesList[i].path,
        filename: imagesList[i].path.split('/').last,
        contentType: MediaType("image", imagesList[i].path.split(".").last),
      ));
    }
    return upImagesFiles;
  }

  void removeImage(int index) {
    imagesList.removeAt(index);
    emit(ImagesSelectionPhotoUpdated());
  }
}
