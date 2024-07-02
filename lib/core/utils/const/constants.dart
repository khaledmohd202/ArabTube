import 'package:arabtube/features/channels/data/model/channel_model.dart';
import 'package:arabtube/features/home/data/models/video.dart';

class Constants {
  static List<VideoModel> model = [];
  static List<VideoModel> foundedItems = [];
  static List<ChannelModel> subscribeModel = [];
  static List<ChannelModel> foundedChannels = [];
  static String baseUrl = 'https://arabtubedemo1.runasp.net/api';
  static const String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU";
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
  static const String videoRoute = '/VideoPage';
  static const String historyRoute = '/HistoryPage';
  static const String watchedLaterRoute = '/WatchedLaterPage';
}
