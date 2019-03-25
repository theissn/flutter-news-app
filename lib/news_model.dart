class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  News({this.title, this.description, this.url, this.urlToImage, this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return new News(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }

}