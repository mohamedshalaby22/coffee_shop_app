import 'package:flutter/material.dart';
import 'app_text.dart';

class SnackBarWidget {
  static showSnackBarWidget(
      BuildContext context, String text, Color backColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: backColor,
        behavior: SnackBarBehavior.floating,
        content: AppText(
          text: text,
          color: Colors.white,
          maxLines: 5,
        )));
  }
}
