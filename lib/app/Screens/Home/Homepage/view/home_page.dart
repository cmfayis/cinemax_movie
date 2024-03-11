import 'package:flutter/material.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/trending_movies.dart';
import 'package:movieapp/app/Services/api/api_key.dart';

import 'package:movieapp/app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Trending>> trendingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = ApiKey().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.KBackground,
          title: const Text(
            'Cinimaxe',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: AppColors.kWhite),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.KBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const    Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 15,),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.kPrimary
                    ),
                  ),
                ),
               
                SizedBox(
                  child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingMovies(snapshot: snapshot);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.amber,
                            height: 200,
                            width: 150,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.amber,
                            height: 200,
                            width: 150,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
