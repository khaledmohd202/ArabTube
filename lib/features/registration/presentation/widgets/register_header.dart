import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors/app_colors.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
