import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
CustomDialog(context,
    {Widget? child, double height = 350, double width = 374}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
        surfaceTintColor: const Color.fromARGB(0, 250, 206, 206),

        // contentPadding: EdgeInsets.zero,
        // title: "",
        // titlePadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        child: SizedBox(height: height.h, width: width.w, child: child)),
  );
}
