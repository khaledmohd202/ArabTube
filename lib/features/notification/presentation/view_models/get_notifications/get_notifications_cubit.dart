import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/repos/notification_repo.dart';


part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this.notificationRepo) : super(GetNotificationsInitial());
  NotificationRepo? notificationRepo;
  Future<void> getNotifications() async {
    emit(GetNotificationsLoadingState());
    var result = await notificationRepo!.getNotifications();
    return result.fold((failure) {
      emit(GetNotificationsErrorState(failure.errMessage));
    }, (data) {
      emit(GetNotificationsSuccessState(data));
    });
  }
}
