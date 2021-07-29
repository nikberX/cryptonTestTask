import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


import '../models/news_post.dart';
import '../models/photo.dart';
import '../models/user.dart';
import '../mobX/news_store.dart';

class StoreProvider with ChangeNotifier {
  final newsStore = NewsStore();
  NewsStore getNewsStore() {
    return newsStore;
  }
}