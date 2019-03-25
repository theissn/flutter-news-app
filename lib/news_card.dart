import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'news_model.dart';

class NewsCard extends StatelessWidget {

  final News news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: _launchURL,

      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              news.urlToImage,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                news.title,
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  news.description
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Published: ${_formatDate()}",
              ),
            ),
            FlatButton(
              child: Text('Open Article'),
              onPressed: _launchURL,
            )
          ],
        ),
      ),

    );
  }

  _formatDate() {
    final String dateString = this.news.publishedAt;

    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('E d LLL - H:m');

    return formatter.format(date);
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