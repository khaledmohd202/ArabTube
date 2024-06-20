import 'dart:math';

class Constants {
  static String baseUrl = 'https://arabtubedemo1.runasp.net/api';
  static const String initialRoute = '/SplashPage';
  static const String onboardingRoute = '/OnboardingPage';
  static const String loginRoute = '/LoginPage';
  static const String registerRoute = '/RegisterPage';
  static const String emailVerificationRoute = '/EmailVerificationPage';
  static const String verificationCompletedRoute = '/VerificationCompletedPage';
  static const String homeRoute = '/HomePage';
  static const String navigationRoute = '/NavigationPage';
  static const String forgotPasswordRoute = '/ForgotPasswordPage';
  static const String resetPasswordRoute = '/ResetPasswordPage';
  static const String changePasswordRoute = '/PasswordChangedPage';
  static const String otpVerificationRoute = '/OTPVerificationPage';
  static const String settingsRoute = '/SettingsPage';
  static const String profileRoute = '/ProfilePage';
  static const String languageRoute = '/LanguagePage';
  static const String shortsRoute = '/ShortsPage';
  static const String liveStreamRoute = '/LiveStreamPage';
  static String userID = Random().nextInt(900000+100000).toString();
}
