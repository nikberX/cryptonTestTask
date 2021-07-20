import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import './news_item.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsProvider>(context);
    final news = newsData.news;
    return ListView.builder( // Not empty, false
            itemCount: news.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  children: [
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(left: 58,top: 41, bottom: 33),
                      child: Text(
                        'News',
                        style: TextStyle(
                          color: Color(0xFF252627),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                );
              }
              return NewsItem(news[index-1]);
            }
      );
  }
}