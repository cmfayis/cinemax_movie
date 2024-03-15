import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movieapp/app/Controller/Bottom/bloc/bottom_navigation_bloc.dart';
import 'package:movieapp/app/Screens/Home/Homepage/view/home_page.dart';
import 'package:movieapp/app/Screens/Home/News/view/news_page.dart';
import 'package:movieapp/app/Screens/Home/Profile/view/profile_page.dart';
import 'package:movieapp/app/Screens/Home/Search/view/search_page.dart';
import 'package:movieapp/app/Screens/Home/Wishlist/view/wishlist_page.dart';
import 'package:movieapp/app/utils/colors.dart';

class BottomNavigatonPage extends StatelessWidget {
  BottomNavigatonPage({super.key});

  List<Widget> screens = <Widget>[
   const HomePage(),
   const SearchPage(),
   const NewsPage(),
   const WishListPage(),
   const ProfilePage(),
  ];

  BottomNavigationBloc BottomNavigatonPageBloc = BottomNavigationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: BottomNavigatonPageBloc,
      builder: (context, state) {
        return Scaffold(
          body: screens.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.KBackground,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kPrimary,
            unselectedIconTheme:const IconThemeData(color: AppColors.kWhite),
            selectedLabelStyle:const TextStyle(fontWeight: FontWeight.bold),
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.home),
                  label: 'Home'),
                   BottomNavigationBarItem(
                  icon: Icon(Ionicons.search),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.newspaper), label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: 'WishList'),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.person_outline), label: 'Profile')
            ],
            currentIndex: state.tabIndex,
            
            unselectedItemColor: const Color.fromARGB(255, 207, 205, 205),
            onTap: (value) {
              BottomNavigatonPageBloc.add(
                TabChangeEvent(tabIndex: value),
              );
            },
          ),
        );
      },
    );
  }
}
