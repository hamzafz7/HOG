import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/shimmer_effect.dart';

class ExplainationWidget extends StatelessWidget {
  const ExplainationWidget({super.key, this.image, this.text});
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("التوضيح :"),
          if (image != null)
            CachedNetworkImage(
              width: 260.w,
              height: 200.h,
              fit: BoxFit.fill,
              imageUrl: image!,
              placeholder: ((context, url) => ShimmerPlaceholder(
                    child: Container(
                      height: 150.h,
                      width: 200.w,
                      color: Colors.black,
                    ),
                  )),
            ),
          SizedBox(
            width: 280.w,
            child: Text(text ?? ""),
          ),
        ],
      ),
    );
  }
}
