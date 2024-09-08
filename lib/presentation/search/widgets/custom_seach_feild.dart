import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class CustomSearchFeild extends StatelessWidget {
  const CustomSearchFeild(
      {super.key, required this.searchController, this.onChanged});
  final TextEditingController searchController;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(50),
          ),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium,
        controller: searchController,
        onChanged: onChanged,
        cursorColor: kprimaryBlueColor,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  ابحث عن ما تريد ما تريد من كوررسات..',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Icon(
              Icons.search,
              color: kprimaryGreyColor,
              size: 40.r,
            ),
          ),
        ),
      ),
    );
  }
}
