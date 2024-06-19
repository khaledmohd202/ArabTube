import 'package:arabtube/core/utils/const/constants.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacementNamed(
        context,
        Constants.onboardingRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height / 2.7,
            left: MediaQuery.of(context).size.width / 2.9,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppIcons.splashIcon,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.appNameString,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(AppIcons.frame_1Icon),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(AppIcons.frame_2Icon),
          ),
        ],
      ),
    );
  }
}
