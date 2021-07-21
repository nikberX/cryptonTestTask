import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import './news_item.dart';

class NewsList extends StatefulWidget {

  @override
  _NewsListState createState() => _NewsListState();
}


class _NewsListState extends State<NewsList> {
  bool isLoading = true;
  bool isInit = false;

  void _loaded() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('NewsListBuild');
    final newsData = Provider.of<NewsProvider>(context, listen: true);
    final news = newsData.news;
    //when data is updated widget gets notified.
    if (news.isNotEmpty) {_loaded();}
    return isLoading 
    ? Center(child: CircularProgressIndicator()) 
    : ListView.builder( // Not empty, false
            itemCount: news.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) { //dumb lifehack to scroll News label =-=
                return Row(
                  children: [
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(left: 58,top: 41 - 10, bottom: 33),
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
              return NewsItem(news[index-1]); // to implement images-background NewsItem we can simply
                                              //add ternary operator to check if photo is null
                                              // ? NewsImageItem : NewsItem
            }
      );
  }
}