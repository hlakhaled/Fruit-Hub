import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.textInputType=TextInputType.text
  });

  final String hintText;
  final bool isPassword;
final   TextInputType textInputType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      cursorColor: AppColors.accentGreen,
      obscureText: widget.isPassword ? !isShow : false,
      decoration: InputDecoration(
        fillColor: AppColors.lightBackground,
        filled: true,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                child: Icon(
                  isShow ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.gray200,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Styles.bold13,
        enabledBorder: outlineInputBorder(AppColors.gray100),
        focusedBorder: outlineInputBorder(AppColors.green700),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
