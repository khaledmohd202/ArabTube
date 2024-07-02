import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/registration/presentation/widgets/register_header.dart';
import '../../../../core/utils/assets/app_icons.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../login/presentation/widgets/custom_text_form_field.dart';
import '../../../onboarding/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String dropDownValue = 'Male';
  bool checkBoxValue = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        // selectedDate = picked;
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RegisterHeader(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'by creating an account',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomTextFormField(
                  hintText: 'Full Name',
                  svgIcon: AppIcons.personIcon,
                  horizontalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 13.h,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomTextFormField(
                  hintText: 'Enter Your Email',
                  svgIcon: AppIcons.emailIcon,
                  horizontalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 13.h,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  svgIcon: AppIcons.lockIcon,
                  horizontalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 13.h,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  svgIcon: AppIcons.lockIcon,
                  horizontalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 13.h,
                  ),
                ),
                termsAndConditionsAcceptance(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Constants.emailVerificationRoute);
                  },
                  foregroundColor: AppColors.whiteColor,
                  backgroundColor: AppColors.buttonColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: AppColors.whiteColor.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget termsAndConditionsAcceptance() {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
            color: AppColors.whiteColor.withOpacity(0.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          value: checkBoxValue,
          onChanged: (bool? value) {
            setState(() {
              checkBoxValue = value!;
            });
          },
          activeColor: AppColors.buttonColor,
        ),
        Text(
          'By clicking on it, you agree to our',
          style: TextStyle(
            color: AppColors.whiteColor.withOpacity(0.5),
            fontSize: 10.sp,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Terms & Conditions',
            style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}

