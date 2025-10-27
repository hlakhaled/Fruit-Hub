import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/assets.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/manager/Auth/auth_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_line.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_outline_button.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

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
                children: [Text("نسيت كلمة المرور؟", style: Styles.semiBold13)],
              ),
              SizedBox(height: 42),
              CustomButton(
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    context.read<AuthCubit>().loginCubit(
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
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "لا تمتلك حساب؟",
                      style: Styles.semiBold16.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                    TextSpan(
                      text: " قم بإنشاء حساب",
                      style: Styles.semiBold16.copyWith(
                        color: AppColors.green700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLine(),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
                    child: Text("أو", style: Styles.semiBold16),
                  ),
                  CustomLine(),
                ],
              ),
              SizedBox(height: 32),
              CustomOutlineButton(
                svgPicture: Assets.assetsImagesGoogle,
                title: "تسجيل بواسطة جوجل",
              ),
              SizedBox(height: 16),
              CustomOutlineButton(
                svgPicture: Assets.assetsImagesApple,
                title: "تسجيل بواسطة أبل",
              ),
              SizedBox(height: 16),
              CustomOutlineButton(
                svgPicture: Assets.assetsImagesFacebook,
                title: "تسجيل بواسطة فيسبوك",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
