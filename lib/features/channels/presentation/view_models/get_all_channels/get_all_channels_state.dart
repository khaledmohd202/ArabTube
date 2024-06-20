part of 'get_all_channels_cubit.dart';

@immutable
abstract class GetAllChannelsState {}

class GetAllChannelsInitial extends GetAllChannelsState {}
class UserGetAllChannelsLoadingState extends GetAllChannelsState {}
class SearchSuccess extends GetAllChannelsState {}
class UserGetAllChannelsSuccessState extends GetAllChannelsState {
  List<ChannelModel> model;
  UserGetAllChannelsSuccessState(this.model);
}
class UserGetAllChannelsErrorState extends GetAllChannelsState {
  final String errMessage;
  UserGetAllChannelsErrorState(this.errMessage);
}
