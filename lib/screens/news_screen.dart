import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/news_list.dart';


class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsProvider>(context,listen: false);
    newsData.tryGetAccessToken().then((_) {
      newsData.fetchData();
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 680,
              child: Center(child: NewsList()),
            ),
          ],
        )
      ),
    );
  }
}