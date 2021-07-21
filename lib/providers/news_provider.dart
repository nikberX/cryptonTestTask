import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


import '../models/news_post.dart';
import '../models/photo.dart';
import '../models/user.dart';

class NewsProvider with ChangeNotifier {
  String? _accessToken = null;
  
  String? get accessToken {
    return _accessToken;
  }

  List<NewsPost> _news = [
  ];

  List<NewsPost> get news {
    return [..._news];
  }

  Future<void> fetchData() async {
    List<NewsPost> fetchedNews = [];

    const urlGet = 'https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994';
    try {
      final response = await http.get(
        Uri.parse(urlGet),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_accessToken'
        }
      );
      
      var decoded = json.decode(response.body);

      for(int i=0;i<decoded['result']['count'];++i) {
        var currentPost = decoded['result']['posts'][i];
        Photo? postPhoto = currentPost['photo'] == null ? null : Photo(
          height: currentPost['photo']['height'], 
          width: currentPost['photo']['width'], 
          id: currentPost['photo']['id']
        );
        fetchedNews.add(NewsPost(
            id: currentPost['id'],
            meta: currentPost['meta'],
            caption: currentPost['caption']=='null' ? null : currentPost['caption'],
            tags: [...currentPost['tags']],
            location: currentPost['location']=='null' ? null : currentPost['location'],
            userId: currentPost['userId'],
            photoId: currentPost['photoId']=='null' ? null : currentPost['photoId'],
            createdAt: currentPost['createdAt'],
            updatedAt: currentPost['updatedAt'],
            photo: postPhoto,
            user: User(
              id: currentPost['user']['id'],
              avatar: null, //В ответе с API нет примера как выглядит поле avatar (id? Набор значений?)
              firstName: currentPost['user']['firstName'],
              lastName: currentPost['user']['lastName'],
              username: currentPost['user']['username'],
            ),
          )
        );//add
      }//for
      _news.clear();
      _news.addAll(fetchedNews);
      notifyListeners();
    } 
    catch (error) {throw error;}
    
  }

  Future tryGetAccessToken() {
    const urlPost = 'https://app.ferfit.club/api/auth/refresh-tokens';
    const bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';
    return http.post(
        Uri.parse(urlPost),
        body: null,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        },
    )
    .catchError((error) => throw error)
    .then((responce) {
        var newToken = jsonDecode(responce.body)['result']['access'];
        _accessToken = (_accessToken == null) || (_accessToken!=newToken)
        ? jsonDecode(responce.body)['result']['access'] 
        : _accessToken;
      }
    );
  }

  
}