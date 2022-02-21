import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_news/model/news_item.dart';
import 'dart:collection';
import 'package:hacker_news/utilities/network_helper.dart';

class NewsDataProvider with ChangeNotifier {

  // 기본url 설정
  NetworkHelper api = NetworkHelper("https://hacker-news.firebaseio.com/v0");

  // 변수 초기화
  String _selectedCategory = "topstories";
  List<int> _newsList = [];
  late int _selectedNewsId;
  final List<String> _categories = [ "topstories", "newstories", "askstories", "showstories", "jobstories" ];
  NewsItem? _selectedNews;

  // getter
  NewsItem? get selectedNews => _selectedNews;
  int get selectedNewsId => _selectedNewsId;
  int get newsCount => _newsList.length;
  String get selectedCategory => _selectedCategory;
  UnmodifiableListView<int> get newsList => UnmodifiableListView(_newsList);
  UnmodifiableListView<String> get categories => UnmodifiableListView(_categories);

  // setter method
  void setSelectedNewsId(value) => _selectedNewsId = value;
  void setCategory(item) => _selectedCategory = item;

  void getNewsList(category) async{
    setCategory(category);
    Response res = await api.get("/$category.json?print=pretty");
    _newsList = res.data.cast<int>();

    notifyListeners();
  }

  void getNews(id) async {
    Response res = await api.get("/item/$id.json?print=pretty");
    _selectedNews = NewsItem.fromJson(res.data);

    notifyListeners();
  }
}