import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height * .025,
            backgroundColor: const Color(0xffff0000),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppIcons.back,
                width: MediaQuery.of(context).size.height * .025,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(
            color: AppColors.buttonColor,
            fontSize: MediaQuery.of(context).size.height * .032,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
