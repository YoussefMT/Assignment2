
import 'package:flutter/material.dart';
import '../news.dart';

/// Stateless widget responsible for creating the NewsList
class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NewsList();
  }
}