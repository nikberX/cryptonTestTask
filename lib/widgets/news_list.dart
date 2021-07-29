import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../providers/news_provider.dart';
import '../widgets/news_label.dart';
import './news_item.dart';

class NewsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final newsStore = Provider.of<StoreProvider>(context).getNewsStore();
    newsStore.tryGetAccessToken().then((_) => newsStore.fetchData());
    return Observer(
      builder: (_) => newsStore.news.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: newsStore.news.length,
            itemBuilder: (context, index) {
              return NewsItem(newsStore.news[index]);          
            }     
          )
    );
  }
}
