import '../../../../core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPicker extends StatelessWidget {
  const CustomPicker({
    super.key,
    required this.hintText,
    required this.text,
    this.controller,
    this.onTap,
    this.suffixIcon,
  });
  final String hintText;
  final String text;
  final TextEditingController? controller;
  final void Function()? onTap;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // text
          ' Date of Birth',
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
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            // controller
            controller: controller,
            readOnly: true,
            // onTap
            onTap: onTap,
            decoration: InputDecoration(
              // hintText
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.whiteColor.withOpacity(0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.whiteColor.withOpacity(0.5),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              //suffixIcon
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
