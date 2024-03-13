import 'package:flutter/material.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import 'package:movieapp/app/utils/colors.dart';

class DetialPage extends StatelessWidget {
  const DetialPage({Key? key, required this.movie}) : super(key: key);
  final  movie;

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
                  "${ApiKey.imagePath}${movie.backdropPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title??movie.name,
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
                              '${movie.voteAverage!.toStringAsFixed(1)}/10',
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
                        // height: 39,
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
                              movie.mediaType??'Movies',
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
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.overview!,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
