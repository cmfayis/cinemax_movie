import 'dart:convert';

import 'package:movieapp/app/Model/Tvshow.dart';
import 'package:movieapp/app/Model/cast.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:http/http.dart' as http;

class ApiKey {
  final apiKey = "855fc7bfdd6ecaed1362423aa8541807";
  static const imagePath = "https://image.tmdb.org/t/p/w500";
  final trendinUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=855fc7bfdd6ecaed1362423aa8541807";

  final topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=855fc7bfdd6ecaed1362423aa8541807";
  final upComingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=855fc7bfdd6ecaed1362423aa8541807";

  final apiReadAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NTVmYzdiZmRkNmVjYWVkMTM2MjQyM2FhODU0MTgwNyIsInN1YiI6IjY1ZWVjZWMzNTk1YTU2MDBjYTNkMjY1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZHqcGzTUlhayv5RBJT3duXl-rR8lFPa0nnSA3_vApGM";

  Future<List<Trending>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendinUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  Future<List<Trending>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  Future<List<Trending>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  final baseUrl = 'https://api.themoviedb.org/3/';
  var key = '?api_key=f495adcbdf28ad96fdf954a0df47a539';
  late String endPoint;
  Future<List<TvShow>> getPopularTvShows() async {
    endPoint = 'tv/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => TvShow.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Cast>> getCast(int movieId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${movieId}/credits?api_key=$apiKey"));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['cast'] as List;
      return decodeData.map((movie) => Cast.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }

  Future<List<Trending>> getSimilarMovies(int movieId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey"));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }

  static const malayalamUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=f495adcbdf28ad96fdf954a0df47a539&with_original_language=ml';
  Future<List<Trending>> getMalayamLanguage() async {
    final response = await http.get(Uri.parse(malayalamUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
List<Map<String ,dynamic>>searchResult=[];
  static const search =
      "https://api.themoviedb.org/3/search/movie?api_key=855fc7bfdd6ecaed1362423aa8541807&query=";
  Future <void> searchMovie(String movieName) async {
    final response = await http.get(Uri.parse(search + movieName));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
    for (var item in decodeData) {
      searchResult.add({
        "id":item['id'],
        "title":item['title'],
        "posterPath":item['poster_path'],
      });
      print(searchResult);
    }
    } else {
      throw Exception("Failed to load cast");
    }
  }
}
