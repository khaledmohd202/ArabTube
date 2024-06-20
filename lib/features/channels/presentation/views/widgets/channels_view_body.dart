import 'package:arabtube/features/channels/data/model/channel_model.dart';
import 'package:arabtube/features/channels/presentation/view_models/get_all_channels/get_all_channels_cubit.dart';
import 'package:arabtube/features/channels/presentation/views/widgets/channel_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets/app_icons.dart';
import '../../../../../core/utils/const/constants.dart';
import '../../../../../core/utils/shared_widgets/default_text_form_field.dart';
import '../../../../notification/presentation/views/notification_view.dart';

class ChannelsViewBody extends StatefulWidget {
  const ChannelsViewBody({super.key});

  @override
  State<ChannelsViewBody> createState() => _ChannelsViewBodyState();
}

class _ChannelsViewBodyState extends State<ChannelsViewBody> {
  var searchController = TextEditingController();
  void runFilter(String enteredKeyword) {
    List<ChannelModel> result = [];
    if (enteredKeyword.isEmpty) {
      result = Constants.subscribeModel;
    } else {
      result = Constants.subscribeModel
          .where((item) => item.channelTitle!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      Constants.foundedChannels = result;
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[200]!,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width:  MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    borderSideEnabledColor: Colors.white,
                    hintText: "Search",
                    hasBorder: true,
                    onChange: (value) {
                      runFilter(value);
                    },
                    controller: searchController,
                    borderRadius: 10.r,
                    fillColor: Colors.transparent,
                    borderSideWidth: 1,
                    borderSideColor: Colors.white,
                    prefixIcon: SvgPicture.asset(
                      AppIcons.search,
                      fit: BoxFit.scaleDown,
                      color: const Color(0xffDDDDFF),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height*.025,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(AppIcons.notificationIcon,width: MediaQuery.of(context).size.height*.025,),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          BlocBuilder<GetAllChannelsCubit, GetAllChannelsState>(
              builder: (context, state) {
                if (state is UserGetAllChannelsSuccessState) {
                  return Expanded(
                    child:Constants.foundedChannels.isNotEmpty? ListView.separated(
                      itemCount: Constants.foundedChannels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChannelItem(
                          instance: Constants.foundedChannels[index],
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20.h,);
                    },
                    ):Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.noData,width: MediaQuery.of(context).size.height*.15,),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Text("No Result Found",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*.018,
                          color: const Color(0xffA5A5A5),
                        ),)
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                      child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20.w),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Color(0xffFF0000),
                              ),
                            ],
                          )
                      )
                  );
                }
              }),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}
