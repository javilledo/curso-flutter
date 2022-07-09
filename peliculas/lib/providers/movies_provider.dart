
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/search_response.dart';
import '../models/models.dart';


class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'd1221334923a4714ae3a7e96977e014f';
  final String _baseURL = 'api.themoviedb.org'; // el paquete http ya le va a poner https://
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionsStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionsStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJSONData(String endpoint, [int page = 1]) async { //La página es opcional, con el valor por defecto de 1

    final url = Uri.https(_baseURL, endpoint, 
    {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page' //De esta forma lo que se pasa es un String
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {

    final jsonData = await _getJSONData('3/movie/now_playing');
    final nowPlayingResponse =  NowPlayingResponse.fromJson(jsonData);

    // print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //Va a notificar a todos los widgets que beben de estos datos

  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJSONData('3/movie/popular', _popularPage);
    
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [ ...popularResponse.results, ...popularResponse.results ]; //Con esto es para ir concatenando los resultados de cada página
    notifyListeners(); //Va a notificar a todos los widgets que beben de estos datos
  }

  Future<List<Cast>> getMovieCast(int movieId) async {

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJSONData('3/movie/$movieId/credits');
    final creditsResponse =  CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;

  }

  Future <List<Movie>> searchMovies(String query) async {

    final url = Uri.https(_baseURL, '3/search/movie', 
      {
        'api_key': _apiKey,
        'language': _language,
        'query': query
      });
    
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;

  }

  void getSuggestionsByQuery( String searchTerm){

    debouncer.value = '';

    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (timer){
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((value) => timer.cancel());

  }

}
