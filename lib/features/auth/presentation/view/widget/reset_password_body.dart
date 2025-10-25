import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
            style: Styles.semiBold16.copyWith(color: AppColors.gray950),
          ),
          SizedBox(height: 32),
          CustomTextFormField(hintText: "كلمة المرور", isPassword: true),
          SizedBox(height: 16),
          CustomTextFormField(hintText: "تأكيد كلمة المرور ", isPassword: true),
          SizedBox(height: 24),
          CustomButton(onTap: () {}, title: "إنشاء كلمة مرور جديدة", space: 0),
        ],
      ),
    );
  }
}
