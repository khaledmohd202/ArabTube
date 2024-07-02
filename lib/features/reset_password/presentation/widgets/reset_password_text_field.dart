import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors/app_colors.dart';

class ResetPasswordTextField extends StatelessWidget {
  const ResetPasswordTextField({
    super.key,
    required this.borderDecoration,
    required this.hintText,
  });

  final InputBorder? borderDecoration;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      onSaved: (newValue) {},
      // validator: (value) {},
      decoration: InputDecoration(
        // 1- hint text
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.accentColor,
          fontSize: 15.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 20.w,
        ),
        border: borderDecoration,
        focusedBorder: borderDecoration,
        enabledBorder: borderDecoration,
        disabledBorder: borderDecoration,
        errorBorder: borderDecoration!.copyWith(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
          ),
        ),
        focusedErrorBorder: borderDecoration!.copyWith(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Icon(
            Icons.visibility_off,
            color: AppColors.accentColor,
          ),
        ),
      ),
    );
  }
}
