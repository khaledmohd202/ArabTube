import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors/app_colors.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.whiteColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        height: 30.h,
        width: 30.w,
        decoration: const BoxDecoration(
          // color: AppColors.buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.whiteColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
