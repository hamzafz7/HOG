import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/shimmer_effect.dart';
import 'package:hog/data/models/choice_model.dart';

class ResultListTile extends StatelessWidget {
  const ResultListTile(
      {super.key,
      required this.choiceModel,
      required this.value,
      this.userSolution});
  final ChoiceModel choiceModel;
  final bool value;
  final bool? userSolution;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              hoverColor: kprimaryBlueColor,
              activeColor: value ? Colors.green : Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0.r),
              ),
              side: MaterialStateBorderSide.resolveWith((states) {
                if (value) {
                  return const BorderSide(width: 1.0, color: Colors.green);
                } else if (userSolution == true && !value) {
                  return const BorderSide(width: 1.0, color: Colors.red);
                } else {
                  return const BorderSide(width: 1.0, color: Colors.grey);
                }
              }),
              value: value || userSolution!,
              onChanged: (value) {},
            ),
          ),
          Column(
            children: [
              if (choiceModel.image != null)
                CachedNetworkImage(
                  width: 280.w,
                  height: 200.h,
                  fit: BoxFit.fill,
                  imageUrl: choiceModel.image!,
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
                child: Text(choiceModel.title ?? ""),
              ),
            ],
          )
        ],
      ),
    );
  }
}
