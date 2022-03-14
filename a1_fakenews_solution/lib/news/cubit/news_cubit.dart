import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../news.dart';

part 'news_state.dart';


///Control NewsItems and access their state
class NewsCubit extends Cubit<NewsState> {

  int currentlyReading = -1;

  NewsDatabase database = NewsDatabase();

  ///constructor
  NewsCubit() : super(NewsState()) {
    _fetchNews();
  }

  ///retrieve the news
  Future<void> _fetchNews() async{

    //fetching should happen from NewsStatus Initial
    //move it to that state
    emit(state.copyWith(status:NewsStatus.initial));

    List<NewsItem> items = await database.getNewsItems();

    //add the items to the state and emit it
    emit(state.copyWith(status:NewsStatus.success, newsItems:items));

    //no error handling requirements at the moment
  }

  ///mark the news item in position index as being read
  void markReading(int index) {
    if(state.newsItems.length <= index) {
      throw RangeError.index(index, state.newsItems,"no such news item");
    }

    //careful here we need to copy all of the items into a new list
    //so we can generate a new state
    List<NewsItem> items = <NewsItem>[]..addAll(state.newsItems);

    //newsItems are immutable so replace the one we have read
    items[index] = items[index].readVersion();

    emit(NewsState(status:state.status, newsItems: items, currentlyReading: index));
  }

}



