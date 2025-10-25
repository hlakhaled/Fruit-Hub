import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.title , this.space=16});
  final void Function() onTap;
  final String title;
  final double space;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: space),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
          decoration: ShapeDecoration(
            color: AppColors.green700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.bold16,
            ),
          ),
        ),
      ),
    );
  }
}
