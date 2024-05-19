import 'package:arabtube/config/routes/routes.dart';
import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationPage extends StatelessWidget {
  EmailVerificationPage({super.key});
  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 48.h,
    textStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColors.accentColor,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: AppColors.greyColor,
        width: 2.w,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.dg),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: AppColors.buttonColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, bottom: 3.h),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 25.sp,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
                SvgPicture.asset(
                  AppIcons.otpIcon,
                  height: 150.h,
                  width: 150.w,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Email Verification',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Please Enter the 6-digit code sent to your email address ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.accentColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'contact.cashierc@gmail.com',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      TextSpan(
                        text: ' to verification your account',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Text(
                  '05:00',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: AppColors.accentColor,
                        width: 2.w,
                      ),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: AppColors.buttonColor,
                        width: 2.w,
                      ),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: AppColors.accentColor,
                        width: 2.w,
                      ),
                    ),
                  ),
                  onChanged: (String pin) {
                    // ignore: avoid_print
                    print('submit pin: $pin');
                  },
                  validator: (String? value) {
                    return value!.length == 6 ? null : 'Invalid OTP';
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive the code? ',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.accentColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomTextButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.verificationCompletedRoute,
                    );
                  },
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.whiteColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
