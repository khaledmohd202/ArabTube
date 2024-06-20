import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/colors/app_colors.dart';
import '../../view_models/get_notifications/get_notifications_cubit.dart';
import 'notification_item.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  @override
  void initState() {
    context.read<GetNotificationsCubit>().getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
               CircleAvatar(
                 radius: MediaQuery.of(context).size.height*.025,
                 backgroundColor: const Color(0xffff0000),
                 child: SvgPicture.asset(AppIcons.back,width: MediaQuery.of(context).size.height * .025,),
               ),
                Expanded(
                  child: Text(
                    "Notifications",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * .022,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20.w),
            child: const Divider(),
          ),

          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
              builder: (context, state) {
            if (state is GetNotificationsSuccessState) {
      
              return state.model.isNotEmpty?  Expanded(
                child: ListView.separated(
                  itemCount: state.model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationItem(instance: state.model[index],);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    child: const Divider(
                      color: Color(0xffD9DBE1),
                    ),
                  );
                },),
              ):Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_notification.gif',
                    width: MediaQuery.of(context).size.height * .2,
                    height: MediaQuery.of(context).size.height * .2,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "No Notifications",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .018,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffA5A5A5)),
                  )
                ],
              ));
            } else {
              return const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xffff0000),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          })
      
        ],
      ),
    );
  }
}
