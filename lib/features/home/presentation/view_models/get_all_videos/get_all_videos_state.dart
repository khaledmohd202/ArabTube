part of 'get_all_videos_cubit.dart';

@immutable
abstract class GetAllVideosState {}

class GetAllVideosInitial extends GetAllVideosState {}
class UserGetAllVideosLoadingState extends GetAllVideosState {}
class SearchSuccess extends GetAllVideosState {}
class UserGetAllVideosSuccessState extends GetAllVideosState {
  List<VideoModel> model;
  UserGetAllVideosSuccessState(this.model);
}
class UserGetAllVideosErrorState extends GetAllVideosState {
  final String errMessage;
  UserGetAllVideosErrorState(this.errMessage);
}
