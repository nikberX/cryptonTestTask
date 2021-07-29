import 'package:crypton_test_task/widgets/news_label.dart';
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
    return SingleChildScrollView(
      child : Column(
          children: <Widget> [
            NewsLabel(),
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: NewsList()
            ),
          ]
        ),
    );
  }
}
