import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Language',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: AppColors.whiteColor.withOpacity(0.5),
                  thickness: 1.0.sign,
                  endIndent: 8.dg,
                  indent: 8.dg,
                  height: 10,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    'Suggested',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Row(
                  children: [
                    // Icon(
                    //   Icons.language,
                    //   color: AppColors.whiteColor,
                    //   size: 30.sp,
                    // ),
                    SizedBox(width: 10.w),
                    Text(
                      'English',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      color: AppColors.buttonColor,
                      size: 25.sp,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  children: [
                    // Icon(
                    //   Icons.language,
                    //   color: AppColors.whiteColor,
                    //   size: 30.sp,
                    // ),
                    SizedBox(width: 10.w),
                    Text(
                      'Arabic',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.check_circle,
                      color: AppColors.buttonColor,
                      size: 25.sp,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Divider(
                  color: AppColors.whiteColor.withOpacity(0.5),
                  thickness: 1.0.sign,
                  endIndent: 8.dg,
                  indent: 8.dg,
                  height: 10,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    'Other',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
