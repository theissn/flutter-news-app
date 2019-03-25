import 'package:flutter/material.dart';
import 'news_list.dart';
import 'news_model.dart';

class Home extends StatelessWidget {

  final List<News> initialNews = []
    ..add(News(
      'No-deal Brexit is..',
      'The bloc says that despite its preparations, the outcome will still cause significant disruption for citizens and businesses',
      'https://news.sky.com/story/eu-warns-a-no-deal-brexit-is-increasingly-likely-11674856',
      'https://e3.365dm.com/19/03/1600x900/skynews-theresa-may-may-gove_4617616.jpg?20190324003737',
      '2019-03-25T12:35:40Z'
    ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        // Remove the DogCard Widget.
        // Instead, use your new DogList Class,
        // Pass in the mock data from the list above.
        child: Center( // Changed code
          child: NewsList(initialNews), // Changed code
        ),
      ),
    );
  }
}