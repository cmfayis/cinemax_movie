import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Home/home_bloc.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:movieapp/app/Screens/Home/Homepage/view/detail_page.dart';
import 'package:movieapp/app/Screens/Home/Search/widget/search_slider.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import 'package:movieapp/app/utils/colors.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  late Future<List<Trending>> searchMovies;

  @override
  void initState() {
    super.initState();
    searchMovies = Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    print(controller.text);
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      appBar: AppBar(
        backgroundColor: AppColors.KBackground,
        automaticallyImplyLeading: false,  
        title:const Padding(
          padding:  EdgeInsets.only(left: 15),
          child:  Text(
            "Search ..",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: AppColors.kWhite,
            ),
          ),
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is NavigateState) {
            final movie = state.movie;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetialPage(
                          movie: movie,
                        )));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    searchMovies = ApiKey().searchMovie(value);
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0, left: 20),
                  suffixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.kPrimary,
                    size: 30,
                  ),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: AppColors.kWhite),
                  fillColor: const Color.fromARGB(255, 143, 134, 134),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: AppColors.kPrimary, width: 2.0),
                  ),
                ),
                style: const TextStyle(color: AppColors.kWhite),
              ),
              Expanded(
                child: FutureBuilder<List<Trending>>(
                  future: searchMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(color: AppColors.kWhite),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return SearchSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: Text('No data available.'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
