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
      body: Stack(
        children: [
          FutureBuilder(
              future: getArticles,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 60, 10, 20),
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: [Colors.black, Colors.grey],
                                  begin: Alignment(0, 1),
                                  end: Alignment(0, 0),
                                )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(Iconsax.receipt_add),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'News24',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade400,
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: const Icon(
                                                Iconsax.notification))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'Good Morning DettyBoy',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.waves)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Discover Breaking News',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: SearchBar(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey.shade700),
                                            leading: const Icon(
                                                Iconsax.search_favorite4),
                                            hintText: 'Find Breaking News',
                                            hintStyle:
                                                const MaterialStatePropertyAll(
                                                    TextStyle(
                                                        color: Colors.white)),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                                width: 30,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child:
                                                    const Icon(Iconsax.radar)))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Breaking News',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.fire_extinguisher)
                                          ],
                                        ),
                                        Text(
                                          'View All',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                                padding: const EdgeInsets.only(top: 100),
                                itemCount: 92,
                                itemBuilder: (context, index) {
                                  final news = data![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FullDetails(news: news)));
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.all(10),
                                      color: Colors.grey.shade400,
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        leading: Image.network(
                                            data[index].urlToImage),
                                        title: Text(data[index].title),
                                        subtitle: Text(data[index].source),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 400,
            child: Container(
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              width: 300,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
