import 'package:arabtube/config/routes/routes.dart';
import 'package:arabtube/core/utils/assets/app_images.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  final InputBorder? borderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.dg),
    borderSide: BorderSide(
      color: AppColors.accentColor,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15.dg),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  AppImages.forgotPasswordImage,
                  scale: 0.55.dg,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Please enter your new password.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                ResetPasswordTextForm(
                  borderDecoration: borderDecoration,
                  hintText: 'Repeat Password',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Repeat Password',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                ResetPasswordTextForm(
                  borderDecoration: borderDecoration,
                  hintText: 'Repeat Password',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                CustomTextButton(
                  text: 'Reset Password',
                  onPressed: () {
                    // should be push replacement but for now it's push
                    Navigator.pushNamed(context, Routes.changePasswordRoute);
                  },
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.whiteColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordTextForm extends StatelessWidget {
  const ResetPasswordTextForm({
    super.key,
    required this.borderDecoration,
    required this.hintText,
  });

  final InputBorder? borderDecoration;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      onSaved: (newValue) {},
      // validator: (value) {},
      decoration: InputDecoration(
        // 1- hint text
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.accentColor,
          fontSize: 15.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 20.w,
        ),
        border: borderDecoration,
        focusedBorder: borderDecoration,
        enabledBorder: borderDecoration,
        disabledBorder: borderDecoration,
        errorBorder: borderDecoration!.copyWith(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
          ),
        ),
        focusedErrorBorder: borderDecoration!.copyWith(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Icon(
            Icons.visibility_off,
            color: AppColors.accentColor,
          ),
        ),
      ),
    );
  }
}