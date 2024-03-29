import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Home/home_bloc.dart';

import 'package:movieapp/app/Services/api/api_key.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            height: 300,
            pageSnapping: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(milliseconds: 800)),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(NavigateEvent(movie: snapshot.data[itemIndex]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  '${ApiKey.imagePath}${snapshot.data[itemIndex].posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
