
import 'package:flutter/material.dart';
import 'package:movieapp/app/Screens/Onboarding/widgets/custom_dots.dart';
import 'package:movieapp/app/utils/colors.dart';
import 'package:movieapp/app/utils/images.dart';

import '../../../Model/onboarding_model.dart';
import '../widgets/custom_Card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboardingList[_currentIndex].bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(28),
          decoration:
              BoxDecoration(gradient: AppColors.customOnboardingGradient),
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      onboarding: onboardingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomDotsIndicator(
                dotsCount: onboardingList.length,
                position: _currentIndex,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == onboardingList.length - 1) {
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                  child: Text('Continue')),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}



List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.kOnboardingFirst,
    title: 'Goods with guaranteed quality',
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingSecond,
    title: "Total warranty if the product doesn't fit",
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
];
