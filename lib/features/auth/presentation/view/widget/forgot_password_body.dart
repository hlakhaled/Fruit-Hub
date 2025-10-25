import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            "لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.",
            style: Styles.semiBold16,
          ),
          SizedBox(height: 32),
          CustomTextFormField(
            hintText: "رقم هاتفك",
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 32),
          CustomButton(onTap: () {}, title: "نسيت كلمة المرور"),
        ],
      ),
    );
  }
}
