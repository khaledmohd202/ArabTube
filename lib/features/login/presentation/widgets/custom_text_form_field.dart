import '../../../../core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.contentPadding,
    this.keyboardType,
    required this.svgIcon,
    required this.horizontalPadding,
  });
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final String svgIcon;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      child: TextFormField(
        // keyboardType
        keyboardType: keyboardType,
        // onTap
        onTap: onTap,
        // onSaved
        onSaved: onSaved,
        // onChanged
        onChanged: onChanged,
        decoration: InputDecoration(
          // contentPadding
          contentPadding: contentPadding,
          // hintText
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.whiteColor.withOpacity(0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
            borderSide: BorderSide(
              // focusedBorderColor
              color: AppColors.whiteColor.withOpacity(0.5),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20,
            ),
            child: SvgPicture.asset(
              // svgIcon
              svgIcon,
              color: AppColors.whiteColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
