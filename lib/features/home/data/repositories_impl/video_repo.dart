import 'package:arabtube/features/home/data/models/video.dart';
import 'package:arabtube/features/home/data/web_services/get_videos.dart';

class VideoRepository {
  GetVideosWebService getVideosWebService;
  VideoRepository({
    required this.getVideosWebService,
  });

  Future<List<Video>> getAllVideos() async {
    final videos = await getVideosWebService.getAllVideos();
    return videos.map((video) => Video.fromJson(video)).toList();
  }
}
