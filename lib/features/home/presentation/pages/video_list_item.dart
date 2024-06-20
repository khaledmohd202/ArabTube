import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final String videoUrl;

  const VideoListItem({super.key, required this.videoUrl});

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 16/9,
          autoPlay: false,
          looping: false,
        );
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _chewieController != null &&
          _chewieController!.videoPlayerController.value.isInitialized
          ? SizedBox(
        height: MediaQuery.of(context).size.height*.25,
            child: Chewie(
                    controller: _chewieController!,
                  ),
          )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}