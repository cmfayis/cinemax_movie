import 'package:flutter/material.dart';
import 'package:movieapp/app/Model/news.dart';
import 'package:movieapp/app/Screens/Home/News/widget/news_design.dart';
import 'package:movieapp/app/Services/api/news_api.dart';
import 'package:movieapp/app/utils/colors.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Article>> news;
  @override
  void initState() {
    super.initState();
    news = NewsService().getEntertainmentNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Trending News",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: AppColors.kPrimary),),
          backgroundColor: AppColors.KBackground,
      ),
        backgroundColor: AppColors.KBackground,
        body: SafeArea(
            child: SingleChildScrollView(
          child: FutureBuilder<List<Article>>(
            future: news,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else if (snapshot.hasData) {
                print(snapshot.data);
                return NewsCard(snapshot: snapshot);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )));
  }
}
