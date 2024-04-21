import 'dart:io';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/profile_page/presentation/bloc/upload_profile_picture_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadProfilePictureCubit(),
      child: BlocBuilder<UploadProfilePictureCubit, UploadProfilePictureState>(
        builder: (context, state) {
          final cubit= BlocProvider.of<UploadProfilePictureCubit>(context);
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap:()async {
                      await _pickImage();
                      await  cubit.uploadPosterImage(_imageFile);
                      },
                    child: Container(
                      width: 27.sw,
                      height: 27.sw,
                      decoration: BoxDecoration(
                          image: _imageFile == null
                              ? null
                              : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(_imageFile!.path),
                              )),
                          shape: BoxShape.circle,
                          border: Border.all(width: 0, color: Colors.transparent),
                          color: kProfilePicBackgroundColor),
                      child: _imageFile == null
                          ? Icon(
                        Icons.person,
                        color: kSemiBlack,
                        size: 12.sw,
                      )
                          : null,
                    ),
                  ),
                ],
              ),
              Gap(4.sw),
              Text(
                'Optional*',
                style: secondaryTextStyle.copyWith(color: kHintColor),
              ),
            ],
          );
        },
      )
    );
  }
}
