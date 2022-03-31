import 'dart:async';

import 'package:lifeline_system/news_model.dart';
import 'package:lifeline_system/service.dart';

enum NewsAction {
  fetch,
  delete,
}

class NewsBloc {
  final _stateStreamController = StreamController<List<Article>>();
  StreamSink<List<Article>> get _newsSink => _stateStreamController.sink;
  Stream<List<Article>> get newsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<NewsAction>();
  StreamSink<NewsAction> get eventSink => _eventStreamController.sink;
  Stream<NewsAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == NewsAction.fetch) {
        try {
          NewsModel news = await API_Manager().getNews();
          if (news != null) {
            _newsSink.add(news.articles!);
          } else {
            _newsSink.addError("Something went wrong");
          }
        } on Exception catch (err) {
          _newsSink.addError(err);
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
