part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoaded extends VideoState {
  final List<Video> videos;

  VideoLoaded(this.videos);
}

final class VideoLoading extends VideoState {}

final class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}

final class VideoEmpty extends VideoState {
  final String message;

  VideoEmpty(this.message);
}
