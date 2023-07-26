// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:timeago/timeago.dart' as timeago;

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final urlToImage;
  final DateTime publishedAt;
  final String source;
  final String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    required this.content,
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
        content: json['content'] ?? '');
  }
}

// Source source;
// required this.source,
// source: Source.fromJson(json['source'] ?? ''),

// class Source {
//   final String id;
//   final String name;

//   Source({required this.id, required this.name});

//   factory Source.fromJson(Map<String, dynamic> json) {
//     return Source(id: json['id'] ?? '', name: json['name'] ?? '');
//   }
// }
