import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Auth/auth_bloc.dart';
import 'package:movieapp/app/Screens/Home/Bottompage/bottom_page.dart';
import 'package:movieapp/app/Screens/Onboarding/view/onboarding.dart';
import 'package:movieapp/app/Screens/Splash/widgets/fade_animation.dart';
import 'package:movieapp/app/utils/colors.dart';

class SplashPageWrapper extends StatelessWidget {
  const SplashPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckLoginStatusEvent()),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.pushReplacement(context, FadeRoute2(BottomNavigatonPage()));
        } else if (state is UnAuthenticatedState) {
          Navigator.pushReplacement(context, FadeRoute2(OnBoardingScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.KBackground,
        body: Center(
          child: Image.asset('assets/image/splash.png',height: 250,width: 250,filterQuality: FilterQuality.high,),
        )
        
      ),
    );
  }
}
