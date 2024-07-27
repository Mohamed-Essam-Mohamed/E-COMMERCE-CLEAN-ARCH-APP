// ignore_for_file: use_key_in_widget_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomAnimatedText({required this.text, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 20.0),
        overflow: TextOverflow.ellipsis,
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              text,
              textStyle: TextStyle(
                color: AppColors.blackColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
              speed: const Duration(milliseconds: 250),
            ),
          ],
        ),
      ),
    );
  }
}
