
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';


class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'd1221334923a4714ae3a7e96977e014f';
  final String _baseURL = 'api.themoviedb.org'; // el paquete http ya le va a poner https://
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJSONData(String endpoint, [int page = 1]) async { //La página es opcional, con el valor por defecto de 1

    var url = Uri.https(_baseURL, endpoint, 
    {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page' //De esta forma lo que se pasa es un String
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {

    final response = await _getJSONData('3/movie/now_playing');
    final nowPlayingResponse =  NowPlayingResponse.fromJson(response);

    // print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //Va a notificar a todos los widgets que beben de estos datos

  }

  getPopularMovies() async {

    _popularPage++;

    final response = await _getJSONData('3/movie/popular', _popularPage);
    
    final popularResponse = PopularResponse.fromJson(response);

    print(popularResponse.results[0].title);
    popularMovies = [ ...popularResponse.results, ...popularResponse.results ]; //Con esto es para ir concatenando los resultados de cada página
    notifyListeners(); //Va a notificar a todos los widgets que beben de estos datos
  }

}
