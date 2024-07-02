import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/assets/app_images.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/settings/presentation/widgets/title_app_bar.dart';
import 'package:arabtube/features/settings/presentation/widgets/watched_video_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WatchedLaterPage extends StatelessWidget {
  const WatchedLaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: leadingAppBar(context),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: TitleAppBar(
          title: 'Watched Later',
          color: AppColors.buttonColor,
        ),
      ),
      body: buildWatchedVideos(),
    );
  }

  Column buildWatchedVideos() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const WatchedVideoItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
          ),
        ),
      ],
    );
  }


  Padding leadingAppBar(BuildContext context) {
    return Padding(
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
    );
  }
}


/*
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
                    child: BinaryImageDisplay(
                      image: instance.thumbnail!,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-20.w, MediaQuery.of(context).size.height * .03),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * .03,
                  backgroundColor: AppColors.primaryColor,
                  child: SvgPicture.asset(
                    AppIcons.play,
                    width: MediaQuery.of(context).size.height * .025,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.06,
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.06,
                ),
              ),


 */