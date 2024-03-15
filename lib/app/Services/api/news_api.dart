import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/app/Model/news.dart';

class NewsService {
  static const String apiKey = '0093cbfabec54415a81a535efc9001a2';
  static const String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=';

  Future<List<Article>> getEntertainmentNews() async {
    final response = await http.get(Uri.parse("${baseUrl}${apiKey}"));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['articles'] as List;
      return decodeData.map((movie) => Article.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }
}
