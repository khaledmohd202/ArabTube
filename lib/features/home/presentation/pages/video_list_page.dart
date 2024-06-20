import 'package:arabtube/features/home/presentation/pages/video_list_item.dart';
import 'package:flutter/material.dart';

class VideoListScreen extends StatelessWidget {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return VideoListItem(
                videoUrl: videoUrls[index],
              );
            },
          ),
        ),
      ],
    );
  }
}