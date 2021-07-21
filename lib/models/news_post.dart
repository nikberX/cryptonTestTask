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
    required this.id ,
    required this.meta ,
    this.caption ,
    required this.tags, //emty list for example
    this.location ,
    required this.userId ,
    this.photoId ,
    required this.createdAt ,
    required this.updatedAt ,
    this.photo ,
    required this.user,
  });
  
}