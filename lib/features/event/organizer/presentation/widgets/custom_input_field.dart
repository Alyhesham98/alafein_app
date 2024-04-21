// ignore_for_file: file_names
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomInputTextFieldWidget extends StatelessWidget {
  const CustomInputTextFieldWidget({
    super.key,
    required this.hintText,
    required this.secure,
    required this.controller,
    required this.onSubmitted,
    this.labelText,
    this.icon,
    this.fillColor,
  });
  final String hintText;
  final String? labelText;
  final bool secure;
  final Function(String) onSubmitted;
  final TextEditingController controller;
  final IconData? icon;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        controller: controller,
        obscureText: secure,
        decoration: InputDecoration(
          focusColor: Colors.transparent,
          border: InputBorder.none,
          fillColor: fillColor == null ? Colors.transparent : fillColor!,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontFamily: StringConst.formulaFont,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: StringConst.formulaFont,
          ),
          icon: SvgPicture.asset(
            AssetsData.search,
            color: const Color(0xFF7C7C7C),
          ),
          suffixIcon: controller != null ? IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.clear),)
             : const SizedBox(),
          ),
        ),
      );
  }
}
