import 'package:flutter/material.dart';
import 'package:movieapp/app/Model/cast.dart';
import 'package:movieapp/app/Model/trending.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/custom_slider.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import 'package:movieapp/app/utils/colors.dart';

class DetialPage extends StatefulWidget {
  const DetialPage({Key? key, required this.movie}) : super(key: key);
  final movie;

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  late Future<List<Cast>> cast;
  late Future<List<Trending>> similarMovies;

  @override
  void initState() {
    super.initState();
    similarMovies = ApiKey().getSimilarMovies(widget.movie.id);
    cast = ApiKey().getCast(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.KBackground,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  "${ApiKey.imagePath}${widget.movie.backdropPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(widget.movie.title ?? widget.movie.name),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title ?? widget.movie.name,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: AppColors.kWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.movie.voteAverage!.toStringAsFixed(1)}/10',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.movie_rounded,
                              size: 14,
                              color: AppColors.kWhite,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.movie.mediaType ?? 'Movies',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.movie.overview!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "SansSerif",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 180,
                    child: FutureBuilder<List<Cast>>(
                      future: cast,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 15,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${ApiKey.imagePath}${snapshot.data![index].profilePath}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      snapshot.data![index].name!,
                                      style: const TextStyle(
                                        color: AppColors.kWhite,
                                        // fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].character!,
                                      style: const TextStyle(
                                        color: AppColors.kWhite,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      "More Like ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimary),
                    ),
                  ),
                  SizedBox(
                    child: FutureBuilder(
                      future: similarMovies,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
