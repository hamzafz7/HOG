import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class CustomActivationFeild extends StatelessWidget {
  const CustomActivationFeild(
      {super.key,
      required this.text,
      required this.controller,
      this.feildHeight,
      required this.onValidate,
      this.action = TextInputAction.next,
      this.svgUrl,
      this.textInputType = TextInputType.name});
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? onValidate;
  final String? svgUrl;
  final TextInputType textInputType;
  final double? feildHeight;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: feildHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(fontSize: 14.sp, color: kDarkBlueColor),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.newline,
          maxLines: feildHeight == null ? 1 : null,
          minLines: feildHeight == null ? 1 : null,
          expands: feildHeight == null ? false : true,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: textInputType,
          controller: controller,
          validator: onValidate,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 221, 220, 220),
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: kprimaryBlueColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 221, 220, 220))),
              hintText: text,
              hintStyle: TextStyle(fontSize: 12.sp)),
        ),
      ),
    );
  }
}
