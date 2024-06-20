import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/app_icons.dart';
import '../../../data/models/notification_model.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.instance});

  final NotificationModel instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10.sp),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.w),
                  child: Image.asset(
                  AppIcons.splashIcon,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.height * 0.07,
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
              ),
              // if (unRead)
              //   CircleAvatar(
              //     radius: MediaQuery.of(context).size.height * .01,
              //     backgroundColor: Colors.white,
              //     child: CircleAvatar(
              //       radius: MediaQuery.of(context).size.height * .007,
              //       backgroundColor: const Color(0xff3498F5),
              //     ),
              //   )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              instance.title!,
                              style: TextStyle(
                                  color: const Color(0xff33312C),
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015),
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      instance.createdAt!,
                      style: TextStyle(
                          color: const Color(0xff8E8E93),
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.height * .013),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        instance.message!,
                        style: TextStyle(
                            color: const Color(0xff6B7A85),
                            fontWeight: FontWeight.w500,
                            fontSize:
                                MediaQuery.of(context).size.height * .013),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
