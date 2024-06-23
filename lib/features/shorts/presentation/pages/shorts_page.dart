import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsPage extends StatelessWidget {
   ShortsPage({super.key});
  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=6JYIGclVQdw',
    'https://www.youtube.com/watch?v=6JYIGclVQdw',
    'https://www.youtube.com/watch?v=6JYIGclVQdw',
    'https://www.youtube.com/watch?v=6JYIGclVQdw',
    'https://www.youtube.com/watch?v=6JYIGclVQdw',
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

// class VideoPlayerWidget extends StatefulWidget {
//   final String url;

//   VideoPlayerWidget({required this.url});

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//         _controller.setLooping(true);
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//         : Center(child: CircularProgressIndicator());
//   }
// }
