import 'package:arabtube/features/live_stream/presentation/pages/live_stream_page.dart';
import 'package:arabtube/features/settings/presentation/pages/settings_page.dart';

import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../channels/presentation/views/channel_view.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int pageIndex = 0;
  final icons = [
    AppIcons.homeIcon,
    AppIcons.channelsIcon,
    AppIcons.shortsIcon,
    AppIcons.settingsIcon,
  ];
  final screens = [
    const HomePage(),
    const ChannelsView(),
    LiveStreamPage(),
    const SettingsPage(),
  ];
  final title = [
    'Home',
    'Channels',
    // 'ADD',
    'Live Stream',
    'Settings',
  ];
  List<BottomNavigationBarItem> items = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[0],
              color: index == 0 ? AppColors.buttonColor : AppColors.greyColor,
              width: 25.sp,
              height: 25.sp,
            ),
            label: title[0],
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[1],
              color: index == 1 ? AppColors.buttonColor : AppColors.greyColor,
              width: 25.sp,
              height: 25.sp,
            ),
            label: title[1],
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     icons[2],
          //     color: index == 2 ? AppColors.buttonColor : AppColors.greyColor,
          //     width: 30.sp,
          //     height: 30.sp,
          //   ),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[2],
              color: index == 2 ? AppColors.buttonColor : AppColors.greyColor,
              width: 25.sp,
              height: 25.sp,
            ),
            label: title[2],
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[3],
              color: index == 3 ? AppColors.buttonColor : AppColors.greyColor,
              width: 25.sp,
              height: 25.sp,
            ),
            label: title[3],
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(
            () {
              index = value;
              pageIndex = value;
            },
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.buttonColor,
        unselectedItemColor: AppColors.greyColor,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
