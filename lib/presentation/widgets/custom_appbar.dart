import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Function()? onPressed;

  const CustomAppBar({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!,
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: onPressed ??
              () {
                Get.back();
              },
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
