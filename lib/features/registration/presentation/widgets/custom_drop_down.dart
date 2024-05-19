import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.onChanged,
    this.value,
  });
  final void Function(String?)? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // text
          ' Gender',
          style: TextStyle(
            color: AppColors.whiteColor.withOpacity(0.5),
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: MediaQuery.of(context).size.height * 0.065,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.5),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              dropdownColor: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
              menuMaxHeight: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              icon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor.withOpacity(0.5),
              ),
              items: [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text(
                    'Male',
                    style: TextStyle(
                      color: AppColors.whiteColor.withOpacity(0.5),
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text(
                    'Female',
                    style: TextStyle(
                      color: AppColors.whiteColor.withOpacity(0.5),
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
