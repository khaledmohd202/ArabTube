part of 'get_notifications_cubit.dart';

@immutable
abstract class GetNotificationsState {}

class GetNotificationsInitial extends GetNotificationsState {}
class GetNotificationsLoadingState extends GetNotificationsState {}
class GetNotificationsSuccessState extends GetNotificationsState {
  List<NotificationModel> model;
  GetNotificationsSuccessState(this.model);
}
class GetNotificationsErrorState extends GetNotificationsState {
  final String errMessage;
 GetNotificationsErrorState(this.errMessage);
}
