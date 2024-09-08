import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/common/utils/utils.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/profile/controllers/profile_controller.dart';
import 'package:hog/presentation/userinfo/widgets/profile_image_edit.dart';
import 'package:hog/presentation/userinfo/widgets/profile_text_feild.dart';
import 'package:hog/presentation/widgets/custom_appbar.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({super.key});
  final controller = Get.find<MyProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "الملف الشخصي",
        onPressed: () {
          controller.isEdited.value = false;
          controller.imagePicked.value = "";
          Get.back();
        },
      ),
      body: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 20.h,
            ),
            ProfileImageEdit(),
            Text(CacheProvider.getUserName() ?? "لا يوجد",
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  Text('المعلومات الشخصية',
                      style: Theme.of(context).textTheme.labelMedium!),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      if (controller.isEdited.value) {
                        controller.changeIsEdit();
                        controller.updateProfile();
                      } else {
                        controller.changeIsEdit();
                      }
                    },
                    child: Obx(
                      () => controller.updateProfileStatus.value ==
                              RequestStatus.loading
                          ? appCircularProgress()
                          : Text(!controller.isEdited.value ? 'تعديل' : 'حفظ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14.sp,
                                      color: kprimaryBlueColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: kprimaryBlueColor)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(
              () => ProfileTextFeild(
                  isEdited: controller.isEdited.value,
                  titleText: "الاسم الكامل",
                  controller: controller.nameController,
                  onValidate: (val) {
                    return Utils.isFeildValidated(val?.trim());
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => ProfileTextFeild(
                  isEdited: controller.isEdited.value,
                  titleText: "رقم الهاتف",
                  controller: controller.phoneController,
                  onValidate: (val) {
                    return Utils.isPhoneValidated(val?.trim());
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            // Obx(
            //   () => ProfileTextFeild(
            //       isEdited: controller.isEdited.value,
            //       titleText: "العنوان",
            //       controller: controller.addressController,
            //       onValidate: (val) {
            //         return null;
            //       }),
            // )
          ]),
        ),
      ),
    );
  }
}
