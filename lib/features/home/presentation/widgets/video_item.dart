import 'package:arabtube/features/home/data/models/video.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/shared_widgets/binary_image.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.instance});
  final VideoModel instance;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  borderRadius: BorderRadius.circular(
                    20.sp,
                  ),
                  child: BinaryImageDisplay(image: instance.thumbnail!,),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-20.w,MediaQuery.of(context).size.height*.03),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CircleAvatar(radius: MediaQuery.of(context).size.height*.03,backgroundColor:AppColors.primaryColor,child: SvgPicture.asset(AppIcons.play,width: MediaQuery.of(context).size.height*.025,),),
              ),
            )
          ],
        ),
        SizedBox(height: 20.h,),
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
                          color: Colors.grey, shape: BoxShape.circle ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width:  MediaQuery.of(context).size.height * 0.06,
                ),
              ),
              SizedBox(width: 20.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(instance.title!,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.016,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),),
                    Text("${instance.channelTitle} . ${instance.views} views . 5 min ago",style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.016,
                      color: const Color(0xff727272),
                      fontWeight: FontWeight.w500,
                    ),),

                  ],
                ),
              ),
              SizedBox(width: 20.w,),
              SvgPicture.asset(AppIcons.menu,width: MediaQuery.of(context).size.height*.005,),
            ],
          ),
        )
      ],
    );
  }
}
