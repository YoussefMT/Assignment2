import 'package:equatable/equatable.dart';

class NewsItem extends Equatable{

  final String title;
  final String body;
  final String author;
  final DateTime date;

  final bool isRead;

  final String image;

  NewsItem( this.title, this.body, this.author, this.date, this.image, this.isRead);

  NewsItem readVersion() {
    return NewsItem(this.title, this.body, this.author, this.date, this.image, true);
  }

  @override
  List<Object?> get props => [title, body, author, date, isRead];

  bool get stringify => true;
}