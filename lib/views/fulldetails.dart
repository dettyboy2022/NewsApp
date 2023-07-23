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
      body: Column(
        children: [Image.network(widget.news.urlToImage)],
      ),
    );
  }
}
