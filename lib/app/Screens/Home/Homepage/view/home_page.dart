import 'package:flutter/material.dart';
import 'package:movieapp/app/Screens/Home/Homepage/widgets/carousel.dart';
import 'package:movieapp/app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.KBackground,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.KBackground,
      body: Container(
        height: size.height,
        width: size.width,
        color: AppColors.KBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          shrinkWrap: true,
          children: const [
            CustomCarouselSlider(),
          ],
        ),
      ),
    );
  }
}
