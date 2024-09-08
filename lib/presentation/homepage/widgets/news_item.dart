import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/shimmer_effect.dart';
import 'package:hog/data/models/news_model.dart';
import 'package:hog/presentation/homepage/widgets/show_full_news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ShowFullNewsPage(
              newsModel: model,
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: SizedBox(
            height: 230.h,
            child: Card(
              elevation: 3,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.grey,
              borderOnForeground: false,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: model.image ?? defPic,
                        height: 170.h,
                        width: 350.w,
                        fit: BoxFit.fill,
                        placeholder: (context, url) {
                          return ShimmerPlaceholder(
                              child: Container(
                            height: 140.h,
                            color: Colors.black,
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                        width: 200.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: kDarkBlueColor, letterSpacing: 0.0),
                          ),
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
