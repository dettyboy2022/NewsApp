import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> getArticles;

  @override
  void initState() {
    super.initState();
    getArticles = Api().getArticles();
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
              text: 'News', style: TextStyle(fontSize: 20, color: Colors.blue))
        ])),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getArticles,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: 92,
                itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data![index].title),
                    subtitle: Text(data[index].description),
                  ),
                );
              });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
