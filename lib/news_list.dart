import 'package:flutter/material.dart';

import 'news_model.dart';
import 'news_card.dart';

class NewsList extends StatelessWidget {

  final List<News> newsItems;

  NewsList(this.newsItems);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, int) {
        return NewsCard(newsItems[int]);
      }
    );
  }

}