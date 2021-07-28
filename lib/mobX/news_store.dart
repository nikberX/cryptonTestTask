import 'package:mobx/mobx.dart';

import '../models/news_post.dart';
// Include generated file
//part 'news_store.g.dart';


// This is the class used by rest of your codebase
//class NewsStore = _NewsStore with _$NewsStore;

// The store-class
abstract class _NewsStore with Store {
  @observable
  List<NewsPost> _news = [

  ];

  @action
  void fetchData() {
    //some logic
  }

  void getAccessToken() {
    //some logic
  }
}