import 'package:flutter/material.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.brown,
          ),
          child: Center(
              child: AppText(
            text: text,
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ))),
    );
  }
}
