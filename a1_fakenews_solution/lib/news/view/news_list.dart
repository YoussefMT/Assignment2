import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../news.dart';

///the page showing the list of news reader items
///updates the state to indicate when an article has been clicked
///A Sliver News List
class NewsList extends StatefulWidget {

  const NewsList({Key? key}) : super(key: key);
  @override
  State<NewsList> createState() => _NewsListState();
}

//See code sourced from Flutter Docs Sliver App Bar:
//https://api.flutter.dev/flutter/material/SliverAppBar-class.html
class _NewsListState extends State<NewsList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 180.0,
            flexibleSpace:  FlexibleSpaceBar(
              title: const Text('Fake News'),
              background: Image.asset("images/trump.png"),
            ),
          ),
          BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  List<NewsItem> items = state.newsItems;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context,
                          int index) {
                        if (state.status == NewsStatus.success) {
                          return NewsListTile(index: index,
                              newsItem: items[index],
                              key: ObjectKey(items[index]));
                        }
                        else {
                          return CircularProgressIndicator();
                        }
                      },
                      childCount: items.length,
                    ),
                  );
                }
          ),
        ],
      ),
    );
  }
}