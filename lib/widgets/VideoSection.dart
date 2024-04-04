import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:z_media/widgets/ReelSection.dart';

class VideoSection extends StatelessWidget {
  Future<List<String>> fetchVideoUrls() async {
    final url = 'https://z-media-server-4.onrender.com/getVideos';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> videosJson = jsonDecode(response.body);
      List<String> videoUrls = videosJson
          .map((video) =>
              "https://z-media-server-4.onrender.com/video-proxy?url=" +
              Uri.encodeComponent(video['downloadUrl']))
          .toList();
      // return [
      //   // "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
      // ];
      return videoUrls;
    } else {
      throw Exception('Failed to load videos from server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<String>>(
        future: fetchVideoUrls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return ReelSection(videos: snapshot.data ?? []);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
