
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../news.dart';

///Custom ListTile inside a card colored according to row and if it is already read.
class NewsListTile extends StatelessWidget {

  const NewsListTile( {required this.index, required this.newsItem, Key? key} ) : super(key:key);

  final NewsItem newsItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    //change the color to grey if the news article is read
    bool isRead = newsItem.isRead;
    Color color = isRead ? Colors.black26:
    index.isOdd ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark;

    return Card(
      shape: const BeveledRectangleBorder(),
      color: color,
      child: SizedBox(
        height: 75.0,
        child: Center(
          child:
          ListTile(
            leading: Hero(
              child: FadeInImage.memoryNetwork(
                image: newsItem.image,
                placeholder: kTransparentImage,
              ),
              tag: newsItem.hashCode,
            ),
            title: Text(
              newsItem.title,
              overflow: TextOverflow.fade,
              //style: GoogleFonts.cinzel(fontWeight: FontWeight.w600),
            ),
            onTap: () {
              context.read<NewsCubit>().markReading(index);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetail(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}