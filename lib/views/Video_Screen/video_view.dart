import 'package:ecom_app_2411/views/Video_Screen/shorts_video_view/shortvideo.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        ShortVideoPage(),
        ShortVideoPage(),
        ShortVideoPage(),
      ],
    );
  }
}
