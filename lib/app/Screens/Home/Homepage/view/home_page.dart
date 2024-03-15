import 'package:flutter/material.dart';
import 'package:movieapp/app/Model/Tvshow.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/malayalam_movies.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/rated_sliders.dart';
// import 'package:movieapp/app/Screens/Home/Homepage/widgets/rated_sliders.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/trending_movies.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/tvshow.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/upcoming_slider.dart';
import 'package:movieapp/app/Services/api/api_key.dart';

import 'package:movieapp/app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late Future<List<Trending>> malayalam;
  late Future<List<Trending>> trendingMovies;
  late Future<List<Trending>> topRatedMovies;
  late Future<List<Trending>> upComingMovies;
  late Future<List<TvShow>> popularTvShow;
  @override
  void initState() {
    super.initState();
    malayalam=ApiKey().getMalayamLanguage();
    trendingMovies = ApiKey().getTrendingMovies();
    topRatedMovies = ApiKey().getTopRatedMovies();
    upComingMovies = ApiKey().getUpComingMovies();
    popularTvShow = ApiKey().getPopularTvShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.KBackground,
          title: const Text(
            'Cinimax',
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
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
                        return const Center(child: CircularProgressIndicator());
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
                    "Top Rated Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TopRatedSlider(snapshot: snapshot);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                 const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Malayalam Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: malayalam,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MalayalamMovies(snapshot: snapshot);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              
                const Padding(
                  padding: EdgeInsets.only(left: 19,top: 15, bottom: 20),
                  child: Text(
                    "Up Coming Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: upComingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return UpcomingSlider(snapshot: snapshot);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 19,
                    bottom: 15,
                  ),
                  child: Text(
                    "Popular Tv Show",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                 SizedBox(
                  child: FutureBuilder(
                    future: popularTvShow,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return PopularTvShow(snapshot: snapshot);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
