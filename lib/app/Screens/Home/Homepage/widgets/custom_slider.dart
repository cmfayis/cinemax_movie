import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Home/home_bloc.dart';
import 'package:movieapp/app/Model/trending.dart'; // Import Trending model
import 'package:movieapp/app/Services/api/api_key.dart';

class TopRatedSlider extends StatelessWidget {
  const TopRatedSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: () {
                final movie =
                    snapshot.data![index]; // Access the movie correctly
                BlocProvider.of<HomeBloc>(context).add(NavigateEvent(
                    movie: movie)); // Pass the movie to the event
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image.network(
                    "${ApiKey.imagePath}${snapshot.data![index].posterPath}",
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
