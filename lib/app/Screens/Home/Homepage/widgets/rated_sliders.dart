// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Home/home_bloc.dart';
import 'package:movieapp/app/Screens/Home/Homepage/view/detail_page.dart';
import 'package:movieapp/app/Services/api/api_key.dart';

class TopRatedSlider extends StatelessWidget {
  const TopRatedSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is NavigateTopRateState) {
          final snapshot = state.movie;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetialPage(movie: snapshot)));
        }
      },
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: GestureDetector(
                onTap: (){
                       BlocProvider.of<HomeBloc>(context)
                    .add(NavigateTopRatedEvent(movie: snapshot.data[index]));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 200,
                      width: 150,
                      child: Image.network(
                        "${ApiKey.imagePath}${snapshot.data[index].posterPath}",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
