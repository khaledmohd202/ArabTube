import 'package:arabtube/features/video/presentation/widgets/action_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoViewBody extends StatefulWidget {
  const VideoViewBody({super.key});

  @override
  State<VideoViewBody> createState() => _VideoViewBodyState();
}

class _VideoViewBodyState extends State<VideoViewBody> {
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
  ChewieController? chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      aspectRatio: 1.3,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
      showOptions: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Chewie(
              controller: chewieController!,
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: MediaQuery.of(context).size.width * .002,
              vertical: MediaQuery.of(context).size.height * .0015,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff494984).withOpacity(0.28),
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.height * .05),
                bottomRight:
                    Radius.circular(MediaQuery.of(context).size.height * .05),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * .03),
                        child: CachedNetworkImage(
                          height: MediaQuery.of(context).size.width * .11,
                          width: MediaQuery.of(context).size.width * .11,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWr7tF8hS1xTA65YP22gtYCtnLOjVJi0yALjeXzYDtL0h7Mn43QCdnnWrfPpDWVofltT0&usqp=CAU',
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * .018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005),
                            Text(
                              "Amazon prime . 8.2 M views . 5 min ago",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * .014,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionItem(
                          onTap: () {},
                          title: "25.4K",
                          icon: "assets/icons/Frame.svg"),
                      ActionItem(
                          onTap: () {},
                          title: "29",
                          icon: "assets/icons/Frame (2).svg"),
                      ActionItem(
                          onTap: () {},
                          title: "Comment",
                          icon: "assets/icons/Group 75910 (1).svg"),
                      ActionItem(
                          onTap: () {},
                          title: "Share",
                          icon: "assets/icons/Group 18.svg"),
                      ActionItem(
                          onTap: () {},
                          title: "Download",
                          icon: "assets/icons/Group 17.svg"),
                      ActionItem(
                          onTap: () {},
                          title: "Save",
                          icon: "assets/icons/Group 16.svg"),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff494984),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .02),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Subscribe",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * .018,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .002),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
              ],
            ),
          )
        ],
      ),
    );
  }
}
