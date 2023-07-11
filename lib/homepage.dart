import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsorg/models/articles.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Post> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // String url =
    //     "https://newsapi.org/v2/everything?q=tesla&from=2023-06-11&sortBy=publishedAt&apiKey=03490090943c44e59329919ed2d20485";
    // Uri uri = Uri.parse(url);

    // http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  late Future<Post> article;

  @override
  void initState() {
    super.initState();
    article = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'Flutter',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            TextSpan(
                text: 'News',
                style: TextStyle(fontSize: 20, color: Colors.blue))
          ])),
          centerTitle: true,
        ),
        body: FutureBuilder<Post>(
          future: article,
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.done) {
            //   return ListView.builder(itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(snapshot.data!.content),
            //     );
            //   });
            // }
            if (snapshot.hasData) {
              return Text(snapshot.data!.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
