import 'dart:io';
import 'dart:convert';


import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../models/news_post.dart';

// Include generated file
part 'news_store.g.dart';

// This is the class used by rest of your codebase
class NewsStore = _NewsStore with _$NewsStore;

// The store-class
abstract class _NewsStore with Store {
  String? _accessToken;

  String? get accessToken {
    return _accessToken;
  }

  bool isLoading = false;

  @observable 
  ObservableList<NewsPost> news = ObservableList<NewsPost>();

  @action
  Future<void> fetchData() async {
    const String urlGet =
        'https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994';
    news.clear();
    try {
      final response = await Dio().get(
        urlGet,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer $_accessToken'}
          )
      );

      for (int i = 0; i < response.data['result']['count']; ++i) {
        var currentPost = response.data['result']['posts'][i];
        news.add(NewsPost.fromJson(currentPost));
      } 
      news = news;
    } catch (error) {
      throw error;
    }
  }

  Future tryGetAccessToken() {
    const urlPost = 'https://app.ferfit.club/api/auth/refresh-tokens';
    const bearerToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';
    return Dio().post(
      urlPost, 
      options: Options(
        headers: {
          'authorization' : 'Bearer $bearerToken',
        }
      ))
      .then((response) {
        var newToken = response.data['result']['access'];
          _accessToken = (_accessToken == null) || (_accessToken != newToken)
              ? response.data['result']['access']
              : _accessToken;
      });
  }
}
