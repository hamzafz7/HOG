import 'package:flutter/material.dart';

class PrivacyPolicyTitle extends StatelessWidget {
  const PrivacyPolicyTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      textDirection: TextDirection.ltr,
    );
  }
}
