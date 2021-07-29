import 'package:flutter/material.dart';

import './photo.dart';

import './user.dart';

class NewsPost {
  int id;
  Map<String, dynamic> meta;
  String? caption;
  List<String> tags;
  String? location;
  int userId;
  String? photoId;
  String createdAt;
  String updatedAt;
  Photo? photo;
  User user;

  NewsPost({
    required this.id,
    required this.meta,
    this.caption,
    required this.tags, //emty list for example
    this.location,
    required this.userId,
    this.photoId,
    required this.createdAt,
    required this.updatedAt,
    this.photo,
    required this.user,
  });

  NewsPost.fromJson(dynamic parsedJson)
      : id = parsedJson['id'],
        meta = parsedJson['meta'],
        caption =
            parsedJson['caption'] == 'null' ? null : parsedJson['caption'],
        tags = [...parsedJson['tags']],
        location =
            parsedJson['location'] == 'null' ? null : parsedJson['location'],
        userId = parsedJson['userId'],
        photoId =
            parsedJson['photoId'] == 'null' ? null : parsedJson['photoId'],
        createdAt = parsedJson['createdAt'],
        updatedAt = parsedJson['updatedAt'],
        photo = parsedJson['photo'] == null
            ? null
            : Photo(
                height: parsedJson['photo']['height'],
                width: parsedJson['photo']['width'],
                id: parsedJson['photo']['id']),
        user = User(
          id: parsedJson['user']['id'],
          avatar: null,
          firstName: parsedJson['user']['firstName'],
          lastName: parsedJson['user']['lastName'],
          username: parsedJson['user']['username'],
        );
}
