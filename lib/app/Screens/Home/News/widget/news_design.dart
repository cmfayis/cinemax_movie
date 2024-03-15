import 'package:flutter/material.dart';
import 'package:movieapp/app/utils/colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 5.0, // Border width
                    style:
                        BorderStyle.solid, // Border style: solid, dashed, etc.
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.kWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      '${snapshot.data[index].urlToImage}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          snapshot.data[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.kPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Subtitle
                        Text(
                          snapshot.data[index].description ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // Text(
                        //   snapshot.data[index].content,
                        //   style: const TextStyle(
                        //     fontSize: 16,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
           
                 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
