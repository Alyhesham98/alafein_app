import 'dart:io';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
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
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage();
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
  }
}
