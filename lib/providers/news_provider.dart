import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/news_post.dart';
import '../models/photo.dart';
import '../models/user.dart';

class NewsProvider with ChangeNotifier {
  List<NewsPost> _news = [
    NewsPost(
      id: 617,
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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
      meta: [{'entries': [] }],
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

  void fetchData() {
    
  }

  
}