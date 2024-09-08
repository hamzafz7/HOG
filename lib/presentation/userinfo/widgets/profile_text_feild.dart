import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class ProfileTextFeild extends StatefulWidget {
  const ProfileTextFeild(
      {super.key,
      required this.isEdited,
      required this.titleText,
      required this.controller,
      required this.onValidate});
  final bool isEdited;
  final String titleText;
  final TextEditingController controller;
  final String? Function(String?) onValidate;

  @override
  State<ProfileTextFeild> createState() => _ProfileTextFeildState();
}

class _ProfileTextFeildState extends State<ProfileTextFeild> {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: !widget.isEdited
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18.sp, color: kprimaryGreyColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 361.w,
                  height: 52.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF1F1F1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                    child: Text(
                      widget.controller.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kDarkBlueColor),
                    ),
                  ),
                )
              ],
            )
          : SizedBox(
              height: 55.h,
              child: TextFormField(
                cursorHeight: 20.h,
                cursorColor: Colors.black,
                focusNode: myFocusNode,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18.sp),
                controller: widget.controller,
                validator: widget.onValidate,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    hintText: widget.controller.text,
                    floatingLabelStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kprimaryBlueColor),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      widget.titleText,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: myFocusNode.hasFocus
                              ? kprimaryBlueColor
                              : ksecondaryGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kprimaryBlueColor),
                        borderRadius: BorderRadius.circular(13.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ksecondaryGreyColor),
                        borderRadius: BorderRadius.circular(13.r))),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
