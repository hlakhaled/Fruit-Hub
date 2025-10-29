import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/forgot_password.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/register_redirect_row.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/social_login_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: "كلمة المرور",
                isPassword: true,
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ForgotPasswordView.routeName,
                      );
                    },
                    child: Text("نسيت كلمة المرور؟", style: Styles.semiBold13),
                  ),
                ],
              ),
              SizedBox(height: 42),
              CustomButton(
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    context.read<LoginCubit>().loginCubit(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: "تسجيل دخول",
                space: 0,
              ),
              SizedBox(height: 32),
              RegisterRedirectRow(),
              SizedBox(height: 32),
              OrDivider(),
              SizedBox(height: 32),
              SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}
