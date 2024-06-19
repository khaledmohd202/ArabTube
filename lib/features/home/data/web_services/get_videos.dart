import 'package:arabtube/core/utils/const/constants.dart';
import 'package:dio/dio.dart';

class GetVideosWebService {
  late Dio dio;

  GetVideosWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), // 60 seconds
      receiveTimeout: const Duration(seconds: 20), // 60 seconds
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllVideos() async {
    try {
      Response response = await dio.get('Videos/Videos');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
