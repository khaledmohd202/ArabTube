import 'dart:io';

import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/home/data/models/video.dart';
import 'package:arabtube/features/home/presentation/widgets/video_item.dart';
import 'package:arabtube/features/notification/presentation/views/notification_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/shared_widgets/default_text_form_field.dart';
import '../view_models/get_all_videos/get_all_videos_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();
  void runFilter(String enteredKeyword) {
    List<VideoModel> result = [];
    if (enteredKeyword.isEmpty) {
      result = Constants.model;
    } else {
      result = Constants.model
          .where(
            (item) =>
                item.title!
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                item.channelTitle!
                    .toString()
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      Constants.foundedItems = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.05,
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultTextFormField(
                      textInputType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      borderSideEnabledColor: Colors.white,
                      hintText: "Search",
                      hasBorder: true,
                      onChange: (value) {
                        runFilter(value);
                      },
                      controller: searchController,
                      borderRadius: 14.r,
                      fillColor: Colors.transparent,
                      borderSideWidth: 1,
                      borderSideColor: Colors.white,
                      prefixIcon: SvgPicture.asset(
                        AppIcons.search,
                        fit: BoxFit.scaleDown,
                        color: const Color(0xffDDDDFF),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationView(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * .025,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        AppIcons.notificationIcon,
                        width: MediaQuery.of(context).size.height * .025,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            BlocBuilder<GetAllVideosCubit, GetAllVideosState>(
                builder: (context, state) {
              if (state is UserGetAllVideosSuccessState) {
                return Expanded(
                  child: Constants.foundedItems.isNotEmpty
                      ? ListView.separated(
                          itemCount: Constants.foundedItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return VideoItem(
                              instance: Constants.foundedItems[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 20.h);
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.noData,
                                  width:
                                      MediaQuery.of(context).size.height * .15,
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "No Result Found",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.height * .018,
                                color: const Color(0xffA5A5A5),
                              ),
                            )
                          ],
                        ),
                );
              } else {
                return Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Color(0xffFF0000),
                            ),
                          ],
                        )));
              }
            }),
            SizedBox(height: 20.h),
          ],
        ),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  SpeedDial floatingActionButton(BuildContext context) {
    return SpeedDial(
      buttonSize: Size(
        50.w,
        50.h,
      ),
      childrenButtonSize: Size(
        50.w,
        50.h,
      ),
      overlayColor: AppColors.primaryColor,
      overlayOpacity: 0.7,
      spaceBetweenChildren: 5.w,
      icon: Icons.add,
      backgroundColor: AppColors.buttonColor,
      foregroundColor: AppColors.whiteColor,
      activeIcon: Icons.close,
      gradientBoxShape: BoxShape.circle,
      children: [
        customSpeedDialChild(
          icon: AppIcons.shortsIcon,
          label: "Create Shorts",
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Create Short"),
                  content: const Text("This feature is not available yet"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"))
                  ],
                );
              },
            );
          },
        ),
        customSpeedDialChild(
          icon: AppIcons.uploadIcon,
          label: "Upload Video",
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return 
            //   },
            // );
          },
        ),
        customSpeedDialChild(
          icon: AppIcons.personIcon,
          label: "Profile",
          onTap: () {},
        ),
      ],
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required String icon, String? label, void Function()? onTap}) {
    return SpeedDialChild(
      child: SvgPicture.asset(
        icon,
        color: AppColors.whiteColor,
      ),
      label: label,
      labelStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      labelBackgroundColor: AppColors.buttonColor,
      onTap: onTap,
      backgroundColor: AppColors.buttonColor,
    );
  }
}
