import 'package:flutter/material.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
    );
  }
}
