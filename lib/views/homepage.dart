import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsorg/views/fulldetails.dart';
import '../api/api.dart';
import '../models/article.dart';

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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.paperclip),
            SizedBox(
              width: 10,
            ),
            Text(
              'News24',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
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
                    final news = data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullDetails(news: news)));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.red,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Image.network(data[index].urlToImage),
                          title: Text(data[index].title),
                          subtitle: Text(data[index].source),
                        ),
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
