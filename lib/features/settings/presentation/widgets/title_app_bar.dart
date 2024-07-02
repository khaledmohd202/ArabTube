import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
    this.color,
    required this.title,
  });
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 23.0.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
