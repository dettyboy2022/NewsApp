import 'package:flutter/material.dart';

import '../models/article.dart';

class FullDetails extends StatefulWidget {
  final Article news;
  const FullDetails({super.key, required this.news});

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.news.author),
              ],
            ),
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
            Image.network(widget.news.urlToImage),
            const SizedBox(
              height: 15,
            ),
            Text(widget.news.description)
          ],
        ),
      ),
    );
  }
}
