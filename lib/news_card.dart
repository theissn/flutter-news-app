import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'news_model.dart';

class NewsCard extends StatelessWidget {

  final News news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            news.urlToImage
          ),
          Text(
            news.title,
            style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            textAlign: TextAlign.left,
          ),
          Text(
            news.description
          ),
          Text(
            news.publishedAt,
          ),
          FlatButton(
            child: Text('Open Article'),
            onPressed: _launchURL,
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final url = this.news.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}