import 'package:arabtube/core/utils/const/constants.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              // Image.asset(
              //   AppImages.passwordChangedImage,
              //   scale: 0.55.dg,
              // ),
              SvgPicture.asset(
                AppIcons.passwordChangedIcon,
                height: 200.h,
                width: 200.w,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Password Changed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Your password has been changed\n successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              CustomTextButton(
                text: 'Login',
                onPressed: () {
                  // should be push replacement
                  Navigator.pushNamed(context, Constants.loginRoute);
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
    );
  }
}
