// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStore, Store {
  final _$newsAtom = Atom(name: '_NewsStore.news');

  @override
  ObservableList<NewsPost> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<NewsPost> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('_NewsStore.fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}
