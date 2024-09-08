import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/homepage/controller/home_controller.dart';
import 'package:hog/presentation/homepage/widgets/custom_search_bar.dart';
import 'package:hog/presentation/homepage/widgets/news_item.dart';

// ignore: must_be_immutable
class HomeStackHeader extends StatelessWidget {
  HomeStackHeader({super.key});
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CacheProvider.getAppTheme()
              ? const Color.fromARGB(255, 7, 37, 61)
              : Colors.white),
      height: Get.height / 1.56,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 14.w),
                    child: Text(
                      "مرحباً",
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 20.w),
                    child: Text(CacheProvider.getUserName() ?? "",
                        style: Theme.of(context).textTheme.labelLarge)),
              ]),
              const Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 14.w),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 45.h,
                  width: 45.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Center(child: CustomSearchBar()),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text('أخر الأخبار',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelLarge),
          ),
          SizedBox(
            height: 250.h,
            child: Obx(() => switch (controller.getNewsStatus.value) {
                  RequestStatus.success => Swiper(
                      viewportFraction: 0.8,
                      scale: 0.9,
                      loop: true,
                      indicatorLayout: PageIndicatorLayout.SCALE,
                      itemHeight: 300.h,
                      itemWidth: 350.w,
                      layout: SwiperLayout.DEFAULT,
                      autoplay: true,
                      itemCount: controller.newsResponse!.news.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: NewsItem(
                                model: controller.newsResponse!.news[index]),
                          )),
                  RequestStatus.begin => Container(),
                  RequestStatus.loading => Center(
                      child: appCircularProgress(),
                    ),
                  RequestStatus.onError => const Center(
                      child: Text("حدث خطأ"),
                    ),
                  RequestStatus.noData => const Center(
                      child: Text("لا يوجد أخبار للعرض"),
                    ),
                  RequestStatus.noInternentt => const Center(
                      child: Text("لا يوجد اتصال بالانترنت"),
                    ),
                }),
          ),
        ],
      ),
    );
  }
}
