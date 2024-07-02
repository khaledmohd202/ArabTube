import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/assets/app_images.dart';
import '../../../../core/utils/const/constants.dart';

class WatchedVideoItem extends StatelessWidget {
  const WatchedVideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Constants.videoRoute);
                  //     arguments: instance);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 7.3,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Image(
                      image: AssetImage(
                        AppImages.watchedVideoImage,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(
                -10.w,
                MediaQuery.of(context).size.height * .018,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * .022,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(
                    AppIcons.play,
                    width: MediaQuery.of(context).size.height * .02,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        const Column(
          children: [
            Text(''),
          ],
        ),
      ],
    );
  }
}
