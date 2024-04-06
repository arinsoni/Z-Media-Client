import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:z_media/models/Articles.dart';

Future<List<Article>> fetchArticles() async {
  final response = await http.get(Uri.parse('https://z-media-server-4.onrender.com/getArticles'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Article.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}

class TextDisplayPage extends StatefulWidget {
  @override
  State<TextDisplayPage> createState() => _TextDisplayPageState();
}

class _TextDisplayPageState extends State<TextDisplayPage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [Expanded(
          child: FutureBuilder<List<Article>>(
            future: futureArticles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Article>? articles = snapshot.data;
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articles?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articles![index].title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 10), 
                          Text(
                            articles[index].text,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
        
              return Center(child: CircularProgressIndicator());
            },
           ),
        )],
      ),
    );
  }
}
