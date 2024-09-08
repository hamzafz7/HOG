import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/profile/controllers/profile_controller.dart';

// ignore: must_be_immutable
class MyProfileImage extends StatelessWidget {
  MyProfileImage({super.key});

  var controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: kprimaryBlueColor)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(
          () => CircleAvatar(
            radius: 56.r,
            backgroundImage: controller.imagePicked.value != ""
                ? FileImage(File(controller.imagePicked.value)) as ImageProvider
                : CachedNetworkImageProvider(
                    controller.prfoileResponse!.data.image != null
                        ? controller.prfoileResponse!.data.image!
                        : "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?w=740&t=st=1702746365~exp=1702746965~hmac=d69d2e417b17c8e24a04eabd7a5d0ca923eb3a5806a83f576d1f19f0da10318f",
                  ),
          ),
        ),
      ),
    );
  }
}
