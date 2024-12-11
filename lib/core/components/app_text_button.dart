import 'package:coffee_shop_app/core/theming/colors.dart';
import 'package:coffee_shop_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.buttonText,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    required this.onPressed,
  });
  final String buttonText;
  final double? borderRadius, buttonWidth, buttonHeight;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.mainBrown,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          minimumSize: Size(buttonWidth ?? double.infinity, buttonHeight ?? 56),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyles.font17WhiteMedium,
        ));
  }
}
