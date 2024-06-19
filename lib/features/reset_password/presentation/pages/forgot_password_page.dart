import 'package:arabtube/core/utils/const/constants.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/assets/app_images.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15.dg),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.forgotPasswordImage,
                  scale: 0.55.dg,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  ' Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Don’t worry! It happens. Please enter the\n email associated with your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextFormField(
                    onChanged: (value) {},
                    onTap: () {},
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(
                        color: AppColors.accentColor,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 25.0.w, right: 20.0.w),
                        child: SvgPicture.asset(
                          AppIcons.emailIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      border: borderDecoration,
                      focusedBorder: borderDecoration,
                      disabledBorder: borderDecoration,
                      enabledBorder: borderDecoration,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 20.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                CustomTextButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Constants.otpVerificationRoute,
                    );
                  },
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.whiteColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember my password',
                      style: TextStyle(
                        color: AppColors.accentColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
