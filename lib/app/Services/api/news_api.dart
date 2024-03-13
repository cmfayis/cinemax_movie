import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/news.dart';

class NewsService {
  static const String apiKey = '855fc7bfdd6ecaed1362423aa8541807';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String category = 'entertainment';

  Future<List<Article>> getEntertainmentNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl?country=in&category=$category&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles.map((article) => Article.fromJson(article)).toList();
      }
    }

    throw Exception('Failed to load entertainment news');
  }
}
