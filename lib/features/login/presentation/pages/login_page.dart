import 'package:arabtube/core/utils/const/constants.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(
                    AppIcons.loginIcon,
                    height: 90.h,
                    width: 90.w,
                  ),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'Sign in to access your account',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                CustomTextFormField(
                  hintText: 'Enter your email',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 20.w,
                  ),
                  svgIcon: AppIcons.emailIcon,
                  onTap: () {},
                  horizontalPadding: 15.w,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Enter your password',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 20.w,
                  ),
                  svgIcon: AppIcons.lockIcon,
                  onTap: () {},
                  horizontalPadding: 15.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        value: checkBoxValue,
                        onChanged: (value) {
                          setState(() {
                            checkBoxValue = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: AppColors.whiteColor.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Constants.forgotPasswordRoute);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CustomTextButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, Constants.navigationRoute);
                  },
                  foregroundColor: AppColors.whiteColor,
                  backgroundColor: AppColors.buttonColor,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: AppColors.whiteColor.withOpacity(0.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // modalBottomSheet(context);
                        Navigator.pushNamed(context, Constants.registerRoute);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                customDivider(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWithSocialMedia(() {}, AppIcons.facebookIcon),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    loginWithSocialMedia(() {}, AppIcons.twitterIcon),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    loginWithSocialMedia(() {}, AppIcons.googleIcon),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row customDivider(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width * 0.37,
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: AppColors.whiteColor.withOpacity(0.5),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width * 0.37,
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ],
              );
  }

  InkWell loginWithSocialMedia(void Function()? onTap, String svgIcon) {
    return InkWell(
      highlightColor: AppColors.primaryColor,
      onTap: onTap,
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          svgIcon,
        ),
      ),
    );
  }
}
