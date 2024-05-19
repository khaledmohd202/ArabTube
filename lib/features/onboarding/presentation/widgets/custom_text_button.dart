import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.text, this.width, this.height,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        // onPressed
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // backgroundColor
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          // text
          text,
          style: TextStyle(
            fontSize: 18.sp,
            // foregroundColor
            color: foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
