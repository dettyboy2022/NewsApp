// import 'dart:convert';

// NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

// String newsDataToJson(NewsData data) => json.encode(data.toJson());

// class NewsData {
//     String status;
//     int totalResults;
//     List<Article> articles;

//     NewsData({
//         required this.status,
//         required this.totalResults,
//         required this.articles,
//     });

//     factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//     };
// }

// class Article {
//     Source source;
//     String? author;
//     String title;
//     String description;
//     String url;
//     String? urlToImage;
//     DateTime publishedAt;
//     String content;

//     Article({
//         required this.source,
//         this.author,
//         required this.title,
//         required this.description,
//         required this.url,
//         this.urlToImage,
//         required this.publishedAt,
//         required this.content,
//     });

//     factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//     );

//     Map<String, dynamic> toJson() => {
//         "source": source.toJson(),
//         "author": author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt.toIso8601String(),
//         "content": content,
//     };
// }

// class Source {
//     String? id;
//     String name;

//     Source({
//         this.id,
//         required this.name,
//     });

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

// To parse this JSON data, do
//
    // final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    int userId;
    int id;
    String title;
    String body;

    Post({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}

