import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/services/remote/api_service.dart';
import '../../../../core/utils/services/remote/endpoints.dart';
import '../models/video.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService? apiService;

  HomeRepoImpl(this.apiService);


  @override
  Future<Either<Failure, List<VideoModel>>> getAllVideos() async {
    try {
      var response = await apiService!.get(
          endPoint: EndPoints.getAllVideos,
          sendToken:  true
      );

      List<VideoModel> result=[];
      for(var item in response.data)
        {
          result.add( VideoModel.fromJson(item));
        }

      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
