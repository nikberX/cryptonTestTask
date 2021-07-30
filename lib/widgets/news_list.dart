import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../providers/news_provider.dart';
import '../widgets/news_label.dart';
import './news_item.dart';

class NewsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final newsStore = Provider.of<StoreProvider>(context).getNewsStore();
    newsStore.fetchNews();
    final future = newsStore.newsPosts;
    return Observer(
      builder: (_) {
        switch (future!.status) {
          case FutureStatus.pending:
            return Center(child: CircularProgressIndicator());
          case FutureStatus.fulfilled:
            return ListView.builder(
              itemCount: future.result.length,
              itemBuilder: (context, index) {
                return NewsItem(future.result[index]);          
            });
          case FutureStatus.rejected:
            return Text('Oops. An error ocured');    
          default:
            return Container();
        }
      
      }
    );
  }
}
