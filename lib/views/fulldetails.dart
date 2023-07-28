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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.news.urlToImage),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.news.title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(widget.news.source),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Posted by: ${widget.news.author}'),
              Text('Published: ${widget.news.publishedAt.day} days ago')
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(widget.news.description),
          const SizedBox(
            height: 15,
          ),
          Text(widget.news.content),
          TextButton(
              onPressed: () {
                _launchURL(widget.news.url);
              },
              child: const Text('Read More'))
        ],
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
