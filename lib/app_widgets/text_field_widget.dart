import 'package:flutter/material.dart';
import '../helpers/color_helper.dart';
import '../helpers/constant_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool autoFocus;
  const TextFieldWidget({super.key,
    required this.hintText,
    required this.controller,
    required this.autoFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: controller,
      autofocus: autoFocus,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
      cursorColor: ColorHelper.instance.blackColor,
      style: TextStyle(
          fontSize: ConstantHelper.instance.size_20,
          fontWeight: ConstantHelper.instance.w500,
          color: ColorHelper.instance.blackColor
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: ConstantHelper.instance.size_20,
              fontWeight: ConstantHelper.instance.w500,
              color: ColorHelper.instance.greyColor
          ),
          border: InputBorder.none,
      ),
    );
  }
}