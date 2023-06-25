import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_peliculas/models/models.dart';
import 'package:flutter_peliculas/models/search_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final _apiKey = "df40d899d1a7f247b5d36698fbf78fd6";
  final _baseUrl = "api.themoviedb.org";
  final _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    /// print("MoviesProvider inicialilzado");
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {"api_key": _apiKey, "language": _language, "page": "$page"});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final response = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse =
        NowPlayingResponse.fromJson(json.decode(response));

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final response = await _getJsonData('/3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(json.decode(response));

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    /// print("Pidiendo info de: $movieId");
    final response = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(json.decode(response));
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, "/3/search/movie",
        {"api_key": _apiKey, "language": _language, "query": query});
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(json.decode(response.body));
    return searchResponse.results;
  }
}
