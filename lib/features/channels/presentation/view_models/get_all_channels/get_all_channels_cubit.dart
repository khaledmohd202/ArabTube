import 'package:arabtube/core/utils/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/channel_model.dart';
import '../../../data/repos/channel_repo.dart';



part 'get_all_channels_state.dart';

class GetAllChannelsCubit extends Cubit<GetAllChannelsState> {
  GetAllChannelsCubit(this.subscribeRepo) : super(GetAllChannelsInitial());
  static GetAllChannelsCubit get(context) => BlocProvider.of(context);
  ChannelRepo? subscribeRepo;
  Future<void> getAllChannels() async {
    emit(UserGetAllChannelsLoadingState());
    var result = await subscribeRepo!.getChannels();
    return result.fold((failure) {
      emit(UserGetAllChannelsErrorState(failure.errMessage));
    }, (data) {
      Constants.subscribeModel=[];
      for(var item in data)
        {
          Constants.subscribeModel.add(item);
        }
      Constants.foundedChannels=Constants.subscribeModel;

      emit(UserGetAllChannelsSuccessState(data));
    });
  }
}
