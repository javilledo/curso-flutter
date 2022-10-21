
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: constant_identifier_names
const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'ed57255743ae4a78b56a8c27cf2356b8';

class NewsService with ChangeNotifier {

  List<Article> headlines = <Article>[];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};
  
  NewsService(){
    getTopHeadlines();
    categories.forEach((element) {
      categoryArticles[element.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => categoryArticles[selectedCategory];

  getTopHeadlines() async {
    
    const url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);

    notifyListeners();

  }

  getArticlesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty) return categoryArticles[category];

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category] = newsResponse.articles;

    notifyListeners();
  }

}