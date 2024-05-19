import 'package:arabtube/config/routes/routes.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          initialRoute: Routes.initialRoute,
          routes: routes,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.primaryColor)),
    );
  }
}
