
import 'package:a1_fakenews/news/cubit/news_cubit.dart';
import 'package:a1_fakenews/news/model/news_item.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class NewsDetail extends StatelessWidget {
  NewsDetail({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Fake News Story"),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {

          NewsItem newsItem = state.newsItems[state.currentlyReading];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Expanded(
                flex:3,
                child: Hero(
                  child: FadeInImage.memoryNetwork(
                    image: newsItem.image,
                    placeholder: kTransparentImage,
                  ),
                  tag: newsItem.image,
                ),
              ),
              Expanded(
                child: Text(newsItem.title,
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text("Author: " + newsItem.author)
              ),
              Expanded(
                child: Text("${newsItem.date.year.toString()}-${newsItem.date.month.toString().padLeft(2,'0')}-${newsItem.date.day.toString().padLeft(2,'0')}")
              ),
              Expanded(
                child: Text(newsItem.body)
              ),
            ],
          );
        }
      ),
    );
  }
}