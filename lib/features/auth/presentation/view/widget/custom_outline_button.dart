import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.svgPicture,
    required this.title,
  });
  final String svgPicture;
  final String title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        side: BorderSide(color: Color(0xFFDCDEDE)),
        overlayColor: AppColors.gray200,
      ),

      child: ListTile(
        leading: SvgPicture.asset(svgPicture),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.semiBold16,
        ),
      ),
    );
  }
}
