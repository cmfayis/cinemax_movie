// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movieapp/app/Services/api/api_key.dart';
import 'package:movieapp/app/utils/colors.dart';

class NewsDesign extends StatelessWidget {
  const NewsDesign({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                snapshot.data[index].title,
                style: TextStyle(color: AppColors.kWhite),
              ),
              Container(
                  width: 300,
                  height: 300,
                  child: Image.network(
                      "${ApiKey.imagePath}${snapshot.data[index].urlToImage}"))
            ],
          );
        },
      ),
    );
  }
}
