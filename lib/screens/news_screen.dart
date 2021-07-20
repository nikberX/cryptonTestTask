import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/news_list.dart';

class NewsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 680,
              child: Center(child: NewsList()),
            ),
          ],
        )
      )
    );
  }
}