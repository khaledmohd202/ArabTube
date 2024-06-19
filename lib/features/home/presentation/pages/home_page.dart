import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/home/data/models/video.dart';
import 'package:arabtube/features/home/presentation/blocs/cubit/video_cubit.dart';
import 'package:arabtube/features/home/presentation/widgets/custom_sliver_appbar.dart';
import 'package:arabtube/features/home/presentation/widgets/video_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late List<Video> allVideos;
  TabController? _tabController;
  // final tabs = [
  //   'All',
  //   'Learning',
  //   'Religious',
  //   'Sport',
  //   'Food',
  // ];
  // final icons = [
  //   Icons.abc,
  //   Icons.baby_changing_station,
  //   Icons.cable,
  //   Icons.dangerous,
  //   Icons.e_mobiledata,
  // ];
  int current = 0;
  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
    allVideos = BlocProvider.of<VideoCubit>(context).getAllVideos();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<VideoCubit, VideoState>(
        // bloc: BlocProvider.of<VideoCubit>(context),
        builder: (context, state) {
      if (state is VideoLoaded) {
        allVideos = (state).videos;
        return buildLoadedListVideos();
      } else if (state is VideoLoading) {
        return shoLoadingIndicator();
      } else if (state is VideoError) {
        return Center(
          child: Text(state.message),
        );
      }
      return const SizedBox();
    });
  }

  Widget shoLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListVideos() {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final video = allVideos[index];
              return videoCard(video: video);
            },
            childCount: allVideos.length,
          ),
        ),
      ],
    );
  }

  InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.r),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: 1.w,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBlocWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Constants.languageRoute);
          },
          backgroundColor: AppColors.buttonColor,
          child: SvgPicture.asset(AppIcons.addingIcon),
        ),
      ),
    );
  }

  Widget videoCard({required Video video}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: AssetImage(video.thumbnail!),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      video.channelTitle!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 200.h,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(
              video.thumbnail!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}






/*
        // body: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        //   child: Column(
        //     children: [
        //       // SizedBox(
        //       //   height: MediaQuery.of(context).size.height * 0.02,
        //       // ),
        //       Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Container(
        //             height: 50.h,
        //             // color: AppColors.whiteColor,
        //             width: MediaQuery.of(context).size.width * 0.9,
        //             child: ListView.separated(
        //               itemCount: imageList.length,
        //               scrollDirection: Axis.horizontal,
        //               shrinkWrap: true,
        //               separatorBuilder: (context, index) {
        //                 return SizedBox(
        //                   width: MediaQuery.of(context).size.width * 0.02,
        //                 );
        //               },
        //               itemBuilder: (context, index) {
        //                 return Container(
        //                   width: 55.w,
        //                   height: 55.h,
        //                   decoration: const BoxDecoration(
        //                     // color: AppColors.whiteColor,
        //                     shape: BoxShape.circle,
        //                   ),
        //                   child: IconButton(
        //                     icon: Transform.scale(
        //                       scale: 1.2,
        //                       child: Image.asset(
        //                         imageList[index],
        //                       ),
        //                     ),
        //                     onPressed: () {},
        //                   ),
        //                 );
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * 0.02,
        //       ),
        //       VideoListView(),
        //     ],
        //   ),
        // ),




                // TabBar(
                //   labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                //   indicatorWeight: 1,
                //   isScrollable: true,
                //   controller: _tabController,
                //   indicatorColor: AppColors.buttonColor,
                //   labelColor: AppColors.buttonColor,
                //   unselectedLabelColor: AppColors.greyColor,
                //   tabs: List.generate(
                //     10,
                //     (index) => Tab(
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: index == _tabController!.index
                //               ? AppColors.buttonColor
                //               : AppColors.whiteColor,
                //           borderRadius: BorderRadius.circular(15.r),
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.all(8.0.dg),
                //           child: Text(
                //             'All',
                //             style: TextStyle(
                //               fontSize: 15.sp,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Container(
                //       height: 22.h,
                //       // color: AppColors.whiteColor,
                //       width: MediaQuery.of(context).size.width * 0.9,
                //       child: ListView.separated(
                //         itemCount: 10,
                //         scrollDirection: Axis.horizontal,
                //         shrinkWrap: true,
                //         separatorBuilder: (context, index) {
                //           return SizedBox(
                //             width: MediaQuery.of(context).size.width * 0.02,
                //           );
                //         },
                //         itemBuilder: (context, index) {
                //           return Container(
                //             width: 40.w,
                //             // height: 5.h,
                //             decoration: BoxDecoration(
                //               color: AppColors.buttonColor,
                //               // shape: BoxShape.circle,
                //               borderRadius: BorderRadius.circular(15.r),
                //             ),
                //             child: Text(
                //               'All',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: AppColors.whiteColor,
                //                 fontSize: 15.sp,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // ),



Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    width: 70.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? AppColors.buttonColor
                                          : Colors.transparent,
                                      borderRadius: current == index
                                          ? BorderRadius.circular(15.r)
                                          : BorderRadius.circular(10.r),
                                      // border: current == index
                                    ),
                                    child: Center(
                                      child: Text(
                                        tabs[index],
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: current == index,
                                  child: Container(
                                    height: 2.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      color:
                                          AppColors.whiteColor.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          // borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              icons[current],
                              size: 200.sp,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

 */