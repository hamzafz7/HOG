import 'package:flutter/material.dart';
import 'package:hog/common/constants/colors.dart';

class QualityButton extends StatelessWidget {
  const QualityButton(
      {super.key, required this.onPressed, required this.quality});
  final Function() onPressed;
  final String quality;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            quality,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kDarkBlueColor),
          )),
    );
  }
}
