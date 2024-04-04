
import 'package:flutter/material.dart';
import 'package:z_media/widgets/VideoPlayerScreen.dart';

class ReelSection extends StatefulWidget {
  final List<String> videos;

  const ReelSection({Key? key, required this.videos}) : super(key: key);

  @override
  _ReelSectionState createState() => _ReelSectionState();
}

class _ReelSectionState extends State<ReelSection> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: widget.videos.length,
              itemBuilder: (context, index) =>
                  VideoPlayerScreen(url: widget.videos[index]),
            ),
          ),
        ],
      ),
    );
  }
}

