import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article.dart';

class FullDetails extends StatefulWidget {
  final Article news;
  const FullDetails({super.key, required this.news});

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  // final Uri _url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: SafeArea(
      //   child: CustomScrollView(
      //     slivers: [
      //       SliverAppBar(
      //         automaticallyImplyLeading: true,
      //         iconTheme: const IconThemeData(color: Colors.white),
      //         expandedHeight: 400,
      //         flexibleSpace: FlexibleSpaceBar(
      //             background: Image.network(
      //           widget.news.urlToImage,
      //           fit: BoxFit.cover,
      //         )),
      //       ),
      //       SliverList(delegate: SliverChildBuilderDelegate(
      //         (context, index) {
      //           return ListView.builder(
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 children: [Text(widget.news.title)],
      //               );
      //             },
      //           );
      //         },
      //       ))
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.news.urlToImage)),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.news.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(widget.news.source),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Author:'),
                    Text(
                      widget.news.author,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Published:'),
                  Text(
                    '${widget.news.publishedAt.day} days ago',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  )
                ]),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.news.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.news.content,
              style: const TextStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  _launchURL(widget.news.url);
                },
                child: const Text('Read More'))
          ],
        ),
      ),
    );
  }

// url launcher

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  void _launchURL(String? url) async {
    if (url != null) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }
}
