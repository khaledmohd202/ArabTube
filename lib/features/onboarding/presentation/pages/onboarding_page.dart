import 'package:arabtube/config/routes/routes.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/core/utils/strings/app_strings.dart';
import 'package:arabtube/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    AppStrings.skipString,
                    style: TextStyle(
                      fontSize: 16,
                      color: currentIndex == onboardingData.length - 1 ||
                              currentIndex == onboardingData.length - 2
                          ? AppColors.primaryColor
                          : AppColors.buttonColor,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(onboardingData[i].image),
                        const SizedBox(height: 20),
                        Text(
                          onboardingData[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[i].description,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == onboardingData.length - 1) {
                    Navigator.pushNamed(context, Routes.loginRoute);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  currentIndex == onboardingData.length - 1
                      ? AppStrings.getStartedString
                      : AppStrings.nextString,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<dynamic> modalBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //     // clipBehavior: Clip.hardEdge,
  //     context: context,
  //     builder: (context) {
  //       return BackdropFilter(
  //         // blendMode: BlendMode.lighten,
  //         filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
  //         child: Container(
  //           height: MediaQuery.of(context).size.height / 2.6,
  //           width: MediaQuery.of(context).size.width,
  //           decoration: BoxDecoration(
  //             color: AppColors.primaryColor,
  //             borderRadius: const BorderRadius.only(
  //               topLeft: Radius.circular(30),
  //               topRight: Radius.circular(30),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: 0,
  //               vertical: 20,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.max,
  //               children: [
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //                 Text(
  //                   AppStrings.getStartedString,
  //                   style: TextStyle(
  //                     fontSize: 36.sp,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColors.whiteColor,
  //                   ),
  //                 ),
  //                 Text(
  //                   AppStrings.getStartedDescriptionString,
  //                   style: TextStyle(
  //                     color: AppColors.whiteColor.withOpacity(0.5),
  //                     fontSize: 12.sp,
  //                   ),
  //                 ),
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  //                 CustomTextButton(
  //                   onPressed: () {
  //                     Navigator.pushNamed(context, Routes.parentLoginRoute);
  //                   },
  //                   backgroundColor: AppColors.buttonColor,
  //                   foregroundColor: AppColors.whiteColor,
  //                   text: 'Login as Parents',
  //                   width: MediaQuery.of(context).size.width * 0.8,
  //                   height: MediaQuery.of(context).size.height * 0.065,
  //                 ),
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  //                 CustomTextButton(
  //                   onPressed: () {
  //                     Navigator.pushNamed(context, Routes.loginRoute);
  //                   },
  //                   backgroundColor: AppColors.buttonColor,
  //                   foregroundColor: AppColors.whiteColor,
  //                   text: 'Login as Child',
  //                   width: MediaQuery.of(context).size.width * 0.8,
  //                   height: MediaQuery.of(context).size.height * 0.065,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: currentIndex == index ? 25 : 15,
      height: 8,
      decoration: BoxDecoration(
        color:
            currentIndex == index ? AppColors.buttonColor : AppColors.greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
