import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/settings/presentation/widgets/settings_list_tile.dart';
import 'package:arabtube/features/settings/presentation/widgets/title_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleAppBar(
          title: 'Settings',
          color: AppColors.buttonColor,
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.dg),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, Constants.profileRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'Language',
                  icon: Icons.language,
                  onTap: () {
                    Navigator.pushNamed(context, Constants.languageRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'History',
                  icon: Icons.history,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Constants.historyRoute,
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'Watched Later',
                  icon: Icons.watch_later_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Constants.watchedLaterRoute,
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'Terms & Conditions',
                  icon: Icons.rule,
                  onTap: () {
                    // showDialog(context: context, builder: (context){
                    //   return
                    // });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'About',
                  icon: Icons.info,
                  onTap: () {
                    // Navigator.pushNamed(context, Constants.aboutRoute);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SettingsListTile(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    Navigator.pop(context);
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
