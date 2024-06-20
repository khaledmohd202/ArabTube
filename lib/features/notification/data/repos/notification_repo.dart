import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';
import '../models/notification_model.dart';

abstract class NotificationRepo{
  Future<Either<Failure,List<NotificationModel>>> getNotifications();

}