import 'package:flutter/material.dart';
import 'package:movieapp/app/Screens/Home/News/widget/card.dart';

class NewsDesign extends StatelessWidget {
  const NewsDesign({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Stack(children: [NewsCard(article: snapshot.data[index])]);
          },
        ),
      ),
    );
  }
}
