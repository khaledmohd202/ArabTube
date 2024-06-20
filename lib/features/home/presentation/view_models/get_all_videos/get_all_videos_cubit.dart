import 'package:arabtube/core/utils/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/video.dart';
import '../../../data/repos/home_repo.dart';


part 'get_all_videos_state.dart';

class GetAllVideosCubit extends Cubit<GetAllVideosState> {
  GetAllVideosCubit(this.homeRepo) : super(GetAllVideosInitial());
  static GetAllVideosCubit get(context) => BlocProvider.of(context);
  HomeRepo? homeRepo;
  Future<void> getAllVideos() async {
    emit(UserGetAllVideosLoadingState());
    var result = await homeRepo!.getAllVideos();
    return result.fold((failure) {
      emit(UserGetAllVideosErrorState(failure.errMessage));
    }, (data) {
      Constants.model=[];
      for(var item in data)
        {
          Constants.model.add(item);
        }
      Constants.foundedItems=Constants.model;

      emit(UserGetAllVideosSuccessState(data));
    });
  }
}
