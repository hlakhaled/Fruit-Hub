
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
        decoration: ShapeDecoration(
          color: const Color(0xFF1B5E37) /* Green1-500 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            'ابدأ الان',
            textAlign: TextAlign.center,
            style: Styles.style16,
          ),
        ),
      ),
    );
  }
}
