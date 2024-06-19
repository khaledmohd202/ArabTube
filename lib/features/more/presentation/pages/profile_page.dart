import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/login/presentation/widgets/custom_text_form_field.dart';
import 'package:arabtube/features/onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 23.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.whiteColor,
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(AppColors.buttonColor),
              iconSize: WidgetStateProperty.all(30.0.sp),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.dg),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: CircleAvatar(
                    radius: 55.0.r,
                    backgroundImage: AssetImage('assets/images/khaled.jpg'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                CustomTextFormField(
                  hintText: 'Full Name',
                  svgIcon: AppIcons.personIcon,
                  horizontalPadding: 10.w,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.w,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomTextFormField(
                  hintText: 'Email',
                  svgIcon: AppIcons.emailIcon,
                  horizontalPadding: 10.w,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.w,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomTextFormField(
                  hintText: 'Password',
                  svgIcon: AppIcons.lockIcon,
                  horizontalPadding: 10.w,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.w,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  svgIcon: AppIcons.lockIcon,
                  horizontalPadding: 10.w,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.w,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Save Changes',
                  foregroundColor: AppColors.whiteColor,
                  backgroundColor: AppColors.buttonColor,
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
