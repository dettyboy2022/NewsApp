import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/article.dart';

class Api {
  static const apiKey = '03490090943c44e59329919ed2d20485';
  static const baseURL =
      'https://newsapi.org/v2/everything?q=apple&apiKey=$apiKey';

  Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['articles'];
      return responseJson
          .map<Article>((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
