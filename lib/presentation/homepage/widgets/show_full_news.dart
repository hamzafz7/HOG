import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/shimmer_effect.dart';
import 'package:hog/data/models/news_model.dart';

class ShowFullNewsPage extends StatelessWidget {
  const ShowFullNewsPage({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                imageUrl: newsModel.image ?? defPic,
                height: 300.h,
                width: Get.width,
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return ShimmerPlaceholder(
                      child: Container(
                    height: 180.h,
                    color: Colors.black,
                  ));
                },
              ),
            ),
            SizedBox(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Text(newsModel.title ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!),
                ))
          ]),
        ),
      ),
    );
  }
}
