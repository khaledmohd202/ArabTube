import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors/app_colors.dart';

class LeadingAppBarIcon extends StatelessWidget {
  const LeadingAppBarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
