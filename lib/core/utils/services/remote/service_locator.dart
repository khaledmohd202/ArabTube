import 'package:arabtube/features/channels/data/repos/channel_repo_impl.dart';
import 'package:arabtube/features/notification/data/repos/notification_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';
//dependency Injection

final  getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<NotificationRepoImpl>(NotificationRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ChannelRepoImpl>(ChannelRepoImpl(
    getIt.get<ApiService>(),
  ));
}