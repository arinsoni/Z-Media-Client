import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:z_media/widgets/ReelSection.dart';

class VideoSection extends StatelessWidget {
  Future<List<String>> fetchVideoUrls() async {
    // final url = 'https://z-media-server-4.onrender.com/getVideos';
    // final response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   List<dynamic> videosJson = jsonDecode(response.body);
    //   List<String> videoUrls = videosJson
    //       .map((video) =>
    //           "https://z-media-server-4.onrender.com/video-proxy?url=" +
    //           Uri.encodeComponent(video['downloadUrl']))
    //       .toList();
      return [
        "https://instagram.faep14-2.fna.fbcdn.net/v/t66.30100-16/415116573_410685901656957_6385062686443037514_n.mp4?_nc_ht=instagram.faep14-2.fna.fbcdn.net&_nc_cat=109&_nc_ohc=5G9IUnqPhCoAb5C4_-U&edm=AP_V10EBAAAA&ccb=7-5&oh=00_AfAbLHnp0ndS696JRp4KgKoh9oJe5X-gF4mi-bCwuy1KAg&oe=66132E1C&_nc_sid=2999b8&dl=1&dl=1"
      ];
      // return videoUrls;
    // } else {
    //   throw Exception('Failed to load videos from server');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(
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
      )],
    );
  }
}
