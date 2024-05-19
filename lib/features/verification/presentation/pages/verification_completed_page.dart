import 'package:arabtube/config/routes/routes.dart';
import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationCompletedPage extends StatelessWidget {
  const VerificationCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(
                AppIcons.successfulVerificationIcon,
                height: 200.h,
                width: 200.w,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Congratulations! You have been\n successfully authenticated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CustomTextButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.homeRoute,
                  );
                },
                backgroundColor: AppColors.buttonColor,
                foregroundColor: AppColors.whiteColor,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              Spacer(
                flex: 2.bitLength,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
