import 'package:arabtube/core/utils/const/constants.dart';
import 'package:arabtube/features/home/data/repositories_impl/video_repo.dart';
import 'package:arabtube/features/home/data/web_services/get_videos.dart';
import 'package:arabtube/features/home/presentation/blocs/cubit/video_cubit.dart';
import 'package:arabtube/features/more/presentation/pages/language_page.dart';
import 'package:arabtube/features/more/presentation/pages/profile_page.dart';
import 'package:arabtube/features/more/presentation/pages/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/navigation_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/registration/presentation/pages/register_page.dart';
import '../../features/reset_password/presentation/pages/forgot_password_page.dart';
import '../../features/reset_password/presentation/pages/password_changed_page.dart';
import '../../features/reset_password/presentation/pages/reset_password_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/verification/presentation/pages/email_verification_page.dart';
import '../../features/verification/presentation/pages/verification_completed_page.dart';
import 'package:flutter/material.dart';

class Routes {
  late VideoRepository videoRepository;
  late VideoCubit videoCubit;
  // late GetVideosWebService getVideosWebService;

  Routes() {
    videoRepository =
        VideoRepository(getVideosWebService: GetVideosWebService());
    videoCubit = VideoCubit(videoRepository);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.initialRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case Constants.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case Constants.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case Constants.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case Constants.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordPage(),
        );
      case Constants.resetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordPage(),
        );
      case Constants.changePasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangedPage(),
        );
      case Constants.emailVerificationRoute:
        return MaterialPageRoute(
          builder: (_) => EmailVerificationPage(),
        );
      case Constants.verificationCompletedRoute:
        return MaterialPageRoute(
          builder: (_) => const VerificationCompletedPage(),
        );
      case Constants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VideoCubit(videoRepository),
            child: const HomePage(),
          ),
        );
      case Constants.navigationRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VideoCubit(videoRepository),
            child: const NavigationPage(),
          ),
        );
      case Constants.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case Constants.settingsRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case Constants.languageRoute:
        return MaterialPageRoute(
          builder: (_) => const LanguagePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}

// final routes = {};
