import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_check_box.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(hintText: "الاسم كامل"),
          SizedBox(height: 16),
          CustomTextFormField(hintText: "البريد الإلكتروني"),
          SizedBox(height: 16),
          CustomTextFormField(hintText: "كلمة المرور", isPassword: true),
          SizedBox(height: 16),
          CustomCheckbox(),
          SizedBox(height: 42),
          CustomButton(onTap: () {}, title: "إنشاء حساب جديد", space: 0),
          SizedBox(height: 32),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "تمتلك حساب بالفعل؟",
                  style: Styles.semiBold16.copyWith(color: AppColors.gray400),
                ),
                TextSpan(
                  text: " تسجيل دخول",
                  style: Styles.semiBold16.copyWith(color: AppColors.green700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
