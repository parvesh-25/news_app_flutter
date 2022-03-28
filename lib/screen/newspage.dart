import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';

class NewsPage extends StatefulWidget {
  final List<Article> article;

  NewsPage(this.article);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
