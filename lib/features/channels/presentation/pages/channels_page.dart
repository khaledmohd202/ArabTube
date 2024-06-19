import 'package:arabtube/core/utils/colors/app_colors.dart';
import 'package:arabtube/features/home/presentation/widgets/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChannelsPage extends StatefulWidget {
  const ChannelsPage({super.key});

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  final InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.r),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: 1.w,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(),
          ],
        ),
      ),
    );
  }
}
