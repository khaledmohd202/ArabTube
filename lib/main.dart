import 'package:arabtube/features/channels/data/repos/channel_repo_impl.dart';
import 'package:arabtube/features/channels/presentation/view_models/get_all_channels/get_all_channels_cubit.dart';
import 'package:arabtube/features/notification/data/repos/notification_repo_impl.dart';
import 'package:arabtube/features/notification/presentation/view_models/get_notifications/get_notifications_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/routes/routes.dart';
import 'core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/services/local/cache_helper/cache_helper.dart';
import 'core/utils/services/remote/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_models/get_all_videos/get_all_videos_cubit.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await CacheHelper.init();
  runApp(MyApp(routes: Routes()));
}

class MyApp extends StatelessWidget {
  final Routes routes;
  const MyApp({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(
           create: (context) => GetAllVideosCubit(
             getIt.get<HomeRepoImpl>(),
           )..getAllVideos()),
       BlocProvider(
           create: (context) => GetNotificationsCubit(
             getIt.get<NotificationRepoImpl>(),
           )..getNotifications()),
       BlocProvider(
           create: (context) => GetAllChannelsCubit(
             getIt.get<ChannelRepoImpl>(),
           )..getAllChannels()),
     ],
      child: ScreenUtilInit(
        child: MaterialApp(
          onGenerateRoute: routes.onGenerateRoute,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.primaryColor),
          debugShowCheckedModeBanner: false,
          ),
      ),
    );
  }
}
