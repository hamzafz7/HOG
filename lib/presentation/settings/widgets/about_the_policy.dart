import 'package:flutter/material.dart';

class AboutThePolicyWidget extends StatelessWidget {
  const AboutThePolicyWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
    );
  }
}
