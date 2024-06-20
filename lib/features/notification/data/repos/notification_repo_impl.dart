import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/services/remote/api_service.dart';
import '../../../../core/utils/services/remote/endpoints.dart';
import '../models/notification_model.dart';
import 'notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final ApiService? apiService;

  NotificationRepoImpl(this.apiService);


  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async{
    try {
      var response = await apiService!.get(endPoint: EndPoints.notifications);
      List<NotificationModel> result=[] ;
      for (var item in response.data) {
        result.add(NotificationModel.fromJson(item));
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
