import 'package:arabtube/features/home/presentation/pages/home_page.dart';
import 'package:arabtube/features/login/presentation/pages/login_page.dart';
import 'package:arabtube/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:arabtube/features/registration/presentation/pages/register_page.dart';
import 'package:arabtube/features/reset_password/presentation/pages/forgot_password_page.dart';
import 'package:arabtube/features/reset_password/presentation/pages/otp_verification_page.dart';
import 'package:arabtube/features/reset_password/presentation/pages/password_changed_page.dart';
import 'package:arabtube/features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:arabtube/features/splash/presentation/pages/splash_page.dart';
import 'package:arabtube/features/verification/presentation/pages/email_verification_page.dart';
import 'package:arabtube/features/verification/presentation/pages/verification_completed_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/SplashPage';
  static const String onboardingRoute = '/OnboardingPage';
  static const String loginRoute = '/LoginPage';
  static const String registerRoute = '/RegisterPage';
  static const String emailVerificationRoute = '/EmailVerificationPage';
  static const String verificationCompletedRoute = '/VerificationCompletedPage';
  static const String homeRoute = '/HomePage';
  static const String forgotPasswordRoute = '/ForgotPasswordPage';
  static const String resetPasswordRoute = '/ResetPasswordPage';
  static const String changePasswordRoute = '/PasswordChangedPage';
  static const String otpVerificationRoute = '/OTPVerificationPage';
}

final routes = <String, WidgetBuilder>{
  Routes.initialRoute: (context) => const SplashPage(),
  Routes.onboardingRoute: (context) => const OnboardingPage(),
  Routes.loginRoute: (context) => const LoginPage(),
  Routes.registerRoute: (context) => const RegisterPage(),
  Routes.emailVerificationRoute: (context) => EmailVerificationPage(),
  Routes.verificationCompletedRoute: (context) => const VerificationCompletedPage(),
  Routes.homeRoute: (context) => const HomePage(),
  Routes.forgotPasswordRoute: (context) =>  ForgotPasswordPage(),
  Routes.resetPasswordRoute: (context) =>  ResetPasswordPage(),
  Routes.changePasswordRoute: (context) => const PasswordChangedPage(),
  Routes.otpVerificationRoute: (context) =>  OTPVerificationPage(),
};
