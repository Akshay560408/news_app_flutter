import 'package:flutter/foundation.dart';
import 'package:news_app_flutter/model/Article_response.dart';
import 'package:news_app_flutter/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getSourceNews(String sourceId) async {
    ArticleResponse response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
  
}
final getSourceNewsBloc = GetSourceNewsBloc();