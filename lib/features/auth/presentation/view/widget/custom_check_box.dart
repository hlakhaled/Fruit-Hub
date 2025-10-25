import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isSelected = false;
  @override
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Checkbox(
        side: BorderSide(color: Color(0xFFDCDEDE)),
        activeColor: AppColors.green700,
        value: isSelected,
        onChanged: (value) {
          setState(() {
            isSelected = value!;
          });
        },
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "من خلال إنشاء حساب ، فإنك توافق على",
              style: Styles.semiBold13.copyWith(color: AppColors.gray400),
            ),
            TextSpan(
              text: " الشروط والأحكام الخاصة بنا",
              style: Styles.semiBold13.copyWith(color: AppColors.green600),
            ),
          ],
        ),
      ),
    );
  }
}
