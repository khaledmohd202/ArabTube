import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/services/remote/api_service.dart';
import '../../../../core/utils/services/remote/endpoints.dart';
import '../model/channel_model.dart';
import 'channel_repo.dart';

class ChannelRepoImpl implements ChannelRepo {
  final ApiService? apiService;

  ChannelRepoImpl(this.apiService);


  @override
  Future<Either<Failure, List<ChannelModel>>> getChannels() async{
    try {
      var response = await apiService!.get(endPoint: EndPoints.channels);
      List<ChannelModel> result=[] ;
      for (var item in response.data) {
        result.add(ChannelModel.fromJson(item));
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
