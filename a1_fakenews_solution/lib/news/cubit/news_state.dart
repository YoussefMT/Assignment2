part of 'news_cubit.dart';

///possible news status'
enum NewsStatus {initial, success, failure}

///the state of the list of news items
class NewsState extends Equatable {

  final List<NewsItem> newsItems;
  final NewsStatus status;
  final int currentlyReading;

  const NewsState({
    this.newsItems = const <NewsItem>[],
    this.status = NewsStatus.initial,
    this.currentlyReading = 0,
    });

  ///generate a new NewsState from this
  NewsState copyWith( {
    NewsStatus? status,
    List<NewsItem>? newsItems,
    int? currentArticle
    })
  {
        return NewsState(
          status: status ?? this.status,
          newsItems : newsItems ?? this.newsItems,
          currentlyReading: currentArticle ?? this.currentlyReading,
        );
  }

  @override
  List<Object?> get props => [status, newsItems];

  @override
  bool? get stringify => false;

}
