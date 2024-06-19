import 'package:arabtube/core/utils/assets/app_images.dart';
import 'package:arabtube/core/utils/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: true,
      // leadingWidth: 100.0.sign,
      leading: Padding(
        padding: EdgeInsets.only(left: 12.dg),
        child: Image.asset(
          AppImages.arabtubeImage,
          // height: 40.h,
          // width: 40.w,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 30.0.sign,
          icon: CircleAvatar(
            foregroundImage: AssetImage(AppImages.khaledImage),
          ),
          onPressed: () {
            Navigator.pushNamed(context, Constants.profileRoute);
          },
        ),
      ],
    );
  }
}
