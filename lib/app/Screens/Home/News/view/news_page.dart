import 'package:flutter/material.dart';
import 'package:movieapp/app/utils/colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      body: Center(child: Text('News'),),
    );
  }
}