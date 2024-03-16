import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Home/home_bloc.dart';
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
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                final movie = snapshot.data![index];
                BlocProvider.of<HomeBloc>(context)
                    .add(NavigateEvent(movie: movie));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
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
