// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:timeago/timeago.dart' as timeago;

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final  urlToImage;
  final DateTime publishedAt;
  final String source;
  

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    
  });

  String captionText() {
    final formattedPublishedAt =
        timeago.format(publishedAt, locale: 'en_short');
    return '$source $formattedPublishedAt';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? '', 
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['uri'] ?? '',
      publishedAt: DateTime.tryParse(json['publishedAt']) ?? DateTime.now(),
      source: json['source']['name'],
      urlToImage: json['urlToImage'],
    );
  }
}
