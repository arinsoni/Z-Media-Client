
class Article {
  final String id;
  final String title;
  final String text;

  Article({required this.id, required this.title, required this.text});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['_id'],
      title: json['title'],
      text: json['text'],
    );
  }
}
