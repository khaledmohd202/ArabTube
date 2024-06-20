import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/routes/routes.dart';
import 'core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(MyApp(routes: Routes()));
}

class MyApp extends StatelessWidget {
  final Routes routes;
  const MyApp({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        onGenerateRoute: routes.onGenerateRoute,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.primaryColor),
        debugShowCheckedModeBanner: false,
        ),
    );
  }
}
