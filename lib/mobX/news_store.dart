import 'dart:ffi';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

import '../models/news_post.dart';
import '../services/news_network_service.dart';

// Include generated file
part 'news_store.g.dart';

// This is the class used by rest of your codebase
class NewsStore = _NewsStore with _$NewsStore;

// The store-class
abstract class _NewsStore with Store {
  NewsNetworkService newsService = NewsNetworkService();

  @observable
  ObservableFuture<List<NewsPost>>? newsPosts;

  @action
  Future fetchNews() => newsPosts = ObservableFuture(
        newsService.fetchNews().then((news) => news),
      );
}
