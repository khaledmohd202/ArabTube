import 'package:arabtube/features/home/data/models/video.dart';
import 'package:arabtube/features/home/data/repositories_impl/video_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepository videoRepository;
  List<Video> videos = [];

  VideoCubit(this.videoRepository) : super(VideoInitial());

  List<Video> getAllVideos() {
    videoRepository.getAllVideos().then((videos) {
      emit(VideoLoaded(videos));
      this.videos = videos;
    });
    return videos;
  }
}
