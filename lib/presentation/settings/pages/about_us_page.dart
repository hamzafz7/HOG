import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/settings/widgets/about_us_container.dart';
import 'package:hog/presentation/widgets/custom_appbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "حولنا"),
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            const AboutUsConatiner(
              rightSide: true,
              color: ksecondaryColor,
              title: "من نحن",
              body:
                  'مؤسسة تعليمية بدأت منذ عام 2013 بتقدم خدماتها لطلاب جامعة الاقتصاد من محاضرات وملفات ورقية ودورات تدريسية بمواد الكلية.. تضم مجموعة من نخبة الطلاب وأوائل خريجي الكلية وحملة الشهادات العليا من ماجستير ودكتوراه.. واستفاد من خدماتنا اكتر من 12000 طالب وطالبة حتى الآن .',
            ),
            SizedBox(
              height: 30.h,
            ),
            const AboutUsConatiner(
              rightSide: false,
              color: kprimaryBlueColor,
              title: "بماذا نتميز ؟",
              body:
                  'يتميز بيت العباقرة بالدورات الالكترونية التي يتم فيها تغطية عدد كبير من المواد عن طريق فيديوهات مسجلة يستطيع الطالب مشاهدتها والتفاعل صمنها مع الاساتذة عن طريق الاختبارات الالكترونية والمجموعات الخاصة بطلاب كل دورة.',
            ),
            SizedBox(
              height: 30.h,
            ),
            const AboutUsConatiner(
              rightSide: true,
              color: kprimaryPurpleColor,
              title: "ماذا نقدم ؟",
              body:
                  'تتميز المحاضرات التي نقدمها بالدقة والجودة العلمية والتوسع بالشرح لضمان العلامة الكاملة في امتحانات الطلاب ، وذلك يعود لوجود مشرفين علميين من الاساتذة لتدقيق محتوى الملفات.',
            ),
          ],
        ),
      ),
    );
  }
}
