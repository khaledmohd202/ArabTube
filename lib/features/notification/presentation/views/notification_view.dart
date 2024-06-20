import 'package:arabtube/features/notification/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationViewBody(),
    );
  }
}
