import 'dart:io';

import 'package:dio/dio.dart';
import '../models/news_post.dart';

class NewsNetworkService {
  List<NewsPost> news = [];

  String _currentAccesToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';

  String? get accessToken {
    return _currentAccesToken;
  }

  Future fetchNews() async {
    _refreshTokens();
    await _fetchData();
    return news;
  }

  Future<void> _fetchData() async {
    const String urlGet =
        'https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994';
    news.clear();
    try {
      final responseListWithNews = await Dio().get(urlGet,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $_currentAccesToken'
          }));

      for (int i = 0; i < responseListWithNews.data['result']['count']; ++i) {
        var currentPost = responseListWithNews.data['result']['posts'][i];
        news.add(NewsPost.fromJson(currentPost));
      }
    } catch (error) {
      throw error;
    }
  }

  void _refreshTokens() {
    const urlPost = 'https://app.ferfit.club/api/auth/refresh-tokens';
    Dio().post(
      urlPost,
      options: Options(
        headers: {
          'authorization': 'Bearer $_currentAccesToken',
        },
      ),
    )
        .then(
      (response) {
        if (_currentAccesToken != response.data['result']['access'])
          _currentAccesToken = response.data['result']['access'];
      },
    );
  }
}
