
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_line.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLine(),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
          child: Text("أو", style: Styles.semiBold16),
        ),
        CustomLine(),
      ],
    );
  }
}
