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
      body: FutureBuilder(
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
                            padding: const EdgeInsets.fromLTRB(10, 60, 10, 20),
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
                                        child: const Icon(Iconsax.notification))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Discover Breaking News',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(),
                                      hintText: 'Find Breaking News',
                                      hintStyle: TextStyle(color: Colors.white),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 195,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  data![index].urlToImage,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 20,
                                              left: 20,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Text(
                                                  data[index].source,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  child: Text(data[index].title,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ))
                                          ],
                                        );
                                      }),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 20),
                                child: Text(
                                  'Top News',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 500,
                                child: ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    // itemCount: data?.length,
                                    itemCount: 10,
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
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.all(10),
                                          leading: Image.network(
                                              data[index].urlToImage),
                                          title: Text(data[index].title),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}
