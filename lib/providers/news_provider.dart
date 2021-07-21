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
    NewsPost(
      id: 617,
      meta: {'entries': [] },
      caption: null,
      tags: [],
      location: null,
      userId: 59,
      photoId: "85910ce2-ba53-4080-bf39-91b9cdaaa324",
      createdAt: "2021-05-06T10:00:01.384Z",
      updatedAt: "2021-05-06T10:00:01.384Z",
      photo:Photo(height: 1440,
                  width: 1080,
                  id: "85910ce2-ba53-4080-bf39-91b9cdaaa324"
      ),
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'давно',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'NEWS 3',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'NEWS 4',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'This is news 5. Its bigger',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'This is news 6. Its also bigger',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
    ),
    NewsPost(
      id: 592,
      meta: {'entries': [] },
      caption: 'The last news at number 7.',
      tags: [],
      location: null,
      userId: 59,
      photoId: null,
      createdAt: "2021-04-13T09:28:47.623Z",
      updatedAt: "2021-04-13T09:28:47.623Z",
      photo: null,
      user: User(
                id: 59,
                username: "overetch_afe543",
                avatar: null,
                firstName: "Test",
                lastName: "Test",
      ),
      
    )
  ];

  List<NewsPost> get news {
    return [..._news];
  }

  Future<void> fetchData() async {
    List<NewsPost> fetchedNews = [];

    const bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';

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
        print('Number of post: $i : ');
        var post = decoded['result']['posts'][i];
        print(post['id']);
        print(post['meta']);
        print(post['caption']);
        print([...post['tags']]);
        print(post['location']);
        print(post['userId']);
        print(post['photoId']);
        print(post['createdAt']);
        print(post['user']['id']);
        print(post['user']['firstName']);
        print(post['user']['lastName']);
        print(post['user']['username']);
        print('======================\n');
        print('fetching');
        var currentPost = decoded['result']['posts'][i];
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
            photo: Photo(
              height: 0,
              width: 0,
              id: '123'
            ),
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
      print('fetched');

        
      

      _news.clear();
      print('old cleared');
      _news.addAll(fetchedNews);
      print('added');
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
        //print(jsonDecode(responce.body));
        var newToken = jsonDecode(responce.body)['result']['access'];
        _accessToken = (_accessToken == null) || (_accessToken!=newToken)
        ? jsonDecode(responce.body)['result']['access'] 
        : _accessToken;
        print('token: $_accessToken');
      }
    );
  }

  
}