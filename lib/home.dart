import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'news_list.dart';
import 'news_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: new CircularProgressIndicator()
              ),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("News"),
      ),
      body: futureBuilder,
    );
  }

  Future<List<News>> _getData() async {
    final String apiKey = DotEnv().env['API_KEY'];
    http.Response res = await http.get(
        'https://newsapi.org/v2/top-headlines?country=gb&apiKey=$apiKey'
    );

    final resJson = json.decode(res.body);

    return (resJson['articles'] as List)
        .map((article) => News.fromJson(article))
        .toList();
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<News> newsItems = snapshot.data;
    return NewsList(newsItems);
  }
}
