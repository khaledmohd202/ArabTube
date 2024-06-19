import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/core/utils/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 23.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.whiteColor,
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(AppColors.buttonColor),
              iconSize: WidgetStateProperty.all(30.0.sp),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.dg),
          child: Center(
            child: Column(
              children: [
                Divider(
                  color: AppColors.whiteColor.withOpacity(0.5),
                  thickness: 1.0.sign,
                  endIndent: 8.dg,
                  indent: 8.dg,
                  height: 10,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, Constants.profileRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Language',
                  icon: Icons.language,
                  onTap: () {
                    Navigator.pushNamed(context, Constants.languageRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Notifications',
                  icon: Icons.notifications,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.notificationRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Privacy',
                  icon: Icons.privacy_tip,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.privacyRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Terms & Conditions',
                  icon: Icons.rule,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.termsRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'About',
                  icon: Icons.info,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.aboutRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomListTile(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.logoutRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.whiteColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        height: 30.h,
        width: 30.w,
        decoration: const BoxDecoration(
          // color: AppColors.buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.whiteColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
