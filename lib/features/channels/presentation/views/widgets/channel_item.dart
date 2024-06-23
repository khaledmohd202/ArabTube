import 'package:arabtube/features/channels/data/model/channel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ChannelItem extends StatelessWidget {
  const ChannelItem({super.key, required this.instance});
  final ChannelModel instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              imageUrl: instance.profilePic!.isNotEmpty
                  ? instance.profilePic!
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU",
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.height * 0.06,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instance.channelTitle!,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .016,
                    color: const Color(0xffEFEFEF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "${instance.numOfSubscripers!} ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .014,
                        color: const Color(0xffFF0000)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Subscribers ',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .014,
                            color: const Color(0xffA9A8A8)),
                      ),
                      TextSpan(
                        text: '${instance.numOfVidoes!} Video',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .014,
                            color: const Color(0xffFF0000)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20.r)),
            child: const Text(
              "Subscribe",
              style: TextStyle(color: Color(0xff80869A)),
            ),
          )
        ],
      ),
    );
  }
}
