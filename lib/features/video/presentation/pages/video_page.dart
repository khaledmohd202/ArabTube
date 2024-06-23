import 'package:arabtube/core/utils/assets/app_icons.dart';
import 'package:arabtube/core/utils/colors/app_colors.dart';
// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, watch, _) {
                  // final selectedVideo = watch(selectedVideoProvider).state;
                  return const SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // Image.network(
                            //     selectedVideo!.thumbnailUrl,
                            //     height: 220.0,
                            //     width: double.infinity,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   IconButton(
                            //     iconSize: 30.0,
                            //     icon: const Icon(Icons.keyboard_arrow_down),
                            //     onPressed: () => context
                            //         .read(miniPlayerControllerProvider)
                            //         .state
                            //         .animateToHeight(state: PanelState.MIN),
                            //   ),
                          ],
                        ),
                        // VideoInfo(video: selectedVideo),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // return Column(
                  //   children: [
                  //     // VideoInfo(video: selectedVideo),
                  //     // VideoDescription(video: selectedVideo),
                  //     // VideoMeta(video: selectedVideo),
                  //     // VideoActions(video: selectedVideo),
                  //     // VideoComments(video: selectedVideo),
                  //   ],
                  // );
                  // return VideoCard(
                  //   video: video,
                  //   hasPadding: true,
                  //   onTap: () => _scrollController!.animateTo(
                  //     0,
                  //     duration: const Duration(milliseconds: 200),
                  //     curve: Curves.easeIn,
                  //   ),
                  // );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: AppColors.buttonColor,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.thumb_up),
            label: 'Like',
            onTap: () {
              // Handle like action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.thumb_down),
            label: 'Dislike',
            onTap: () {
              // Handle dislike action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.share),
            label: 'Share',
            onTap: () {
              // Handle share action
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: NavigationBar(
        destinations: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
              width: 25.sp,
              height: 25.sp,
            ),
          ),
          SvgPicture.asset(
            AppIcons.homeIcon,
            width: 25.0,
          ),
          NavigationDestination(
            icon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.homeIcon,
                width: 25.sp,
                height: 25.sp,
              ),
            ),
            label: 'Live Stream',
          ),
        ],
      ),
    );
  }
}

/*
class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}
*
class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Column(
        children: [
          if (_videoPlayerController.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: _chewieController,
              ),
            )
          else
            Center(
              child: CircularProgressIndicator(),
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like action
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  // Handle dislike action
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // Handle share action
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Handle subscribe action
                },
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of comments
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('U$index'),
                  ),
                  title: Text('User $index'),
                  subtitle: Text('This is comment number $index.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



 */