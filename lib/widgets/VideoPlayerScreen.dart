import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({Key? key, required this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isControllerDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.play();
  }

  @override
  void dispose() {
    _isControllerDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.url),
      onVisibilityChanged: (visibilityInfo) {
        if (!_isControllerDisposed && visibilityInfo.visibleFraction == 0) {
          _controller.pause();
        } else if (!_isControllerDisposed &&
            visibilityInfo.visibleFraction > 0) {
          _controller.play();
        }
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: _controller.value.isInitialized
              ? SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller), // Your VideoPlayer widget
                  )
                
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
