// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStore, Store {
  final _$newsPostsAtom = Atom(name: '_NewsStore.newsPosts');

  @override
  ObservableFuture<List<NewsPost>>? get newsPosts {
    _$newsPostsAtom.reportRead();
    return super.newsPosts;
  }

  @override
  set newsPosts(ObservableFuture<List<NewsPost>>? value) {
    _$newsPostsAtom.reportWrite(value, super.newsPosts, () {
      super.newsPosts = value;
    });
  }

  final _$_NewsStoreActionController = ActionController(name: '_NewsStore');

  @override
  Future<dynamic> fetchNews() {
    final _$actionInfo =
        _$_NewsStoreActionController.startAction(name: '_NewsStore.fetchNews');
    try {
      return super.fetchNews();
    } finally {
      _$_NewsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsPosts: ${newsPosts}
    ''';
  }
}
