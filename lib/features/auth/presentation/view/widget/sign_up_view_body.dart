import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/constants/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/auth/presentation/manager/Auth/auth_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_check_box.dart';
import 'package:fruit_hub/features/auth/presentation/view/widget/custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  late String name, password, email;
   bool checkCondation=false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: "الاسم كامل",
              onSaved: (value) {
                name = value!;
              },
            ),
            SizedBox(height: 16),
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
            CustomCheckbox(
              valueChanged: (value) {
                
                checkCondation = value;
              },
            ),
            SizedBox(height: 42),
            CustomButton(
              onTap: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  if (checkCondation == true) {
                    context.read<AuthCubit>().createUserCubit(
                      email: email,
                      password: password,
                      name: name,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("يجب عليك الموافقة على الشروط والإحكام"),
                      ),
                    );
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: "إنشاء حساب جديد",
              space: 0,
            ),
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
                    style: Styles.semiBold16.copyWith(
                      color: AppColors.green700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
