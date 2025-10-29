import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/manager/ForgotPassword/forgot_password_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: globalKey,
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              "لا تقلق، فقط أدخل بريدك الإلكتروني وسنرسل رابط إعادة تعيين كلمة المرور.",
              style: Styles.semiBold16,
            ),

            SizedBox(height: 32),
            CustomTextFormField(
              hintText: "بريدك الإلكتروني",
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),

            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  print('Reset email sent to: $email');

                  context.read<ForgotPasswordCubit>().sendPasswordResetEmail(
                    email,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: "نسيت كلمة المرور",
            ),
          ],
        ),
      ),
    );
  }
}
