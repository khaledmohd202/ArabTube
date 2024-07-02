import 'dart:math';
import 'package:arabtube/core/utils/assets/app_images.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/live_stream/presentation/pages/live_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final String userID = Random().nextInt(900000 + 100000).toString();

class LiveStreamPage extends StatelessWidget {
  LiveStreamPage({super.key});
  final liveIDController = TextEditingController(
    text: Random().nextInt(900000 + 100000).toString(),
  );

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              'Live Stream',
              style: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(AppImages.liveStreamImage),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Your UserID: $userID',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'Please test with two or more devices',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                  ),
                  controller: liveIDController,
                  decoration: InputDecoration(
                    labelText: 'Join or Start a Live by Input an ID',
                    labelStyle: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                chooseVideoType(buttonStyle, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row chooseVideoType(ButtonStyle buttonStyle, BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    child: Text(
                      'Start a Live',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => jumpToLivePage(
                      context,
                      liveID: liveIDController.text,
                      isHost: true,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.016,
                  ),
                  ElevatedButton(
                    style: buttonStyle,
                    child: Text(
                      'Join a Live',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => jumpToLivePage(
                      context,
                      liveID: liveIDController.text,
                      isHost: false,
                    ),
                  )
                ],
              );
  }
}

jumpToLivePage(
  BuildContext context, {
  required String liveID,
  required bool isHost,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LivePage(
        liveID: liveID,
        isHost: isHost,
      ),
    ),
  );
}

