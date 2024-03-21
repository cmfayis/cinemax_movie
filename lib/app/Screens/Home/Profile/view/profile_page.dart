import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/bloc/profile_bloc.dart';
import 'package:movieapp/app/Screens/Auth/view/Login_page.dart';
import 'package:movieapp/app/Screens/Home/Profile/widgets/custom_list.dart';
import 'package:movieapp/app/utils/colors.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(intialEvent());
  }

  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogoutState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is FetchState) {
            print('object');
            name = state.name;
            email = state.email;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Center(
                    child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/image/profile.jpg'))),
                const SizedBox(height: 16.0),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.kPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        email,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(
                  color: AppColors.kPrimary,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomListTile(
                          icon: Icons.language_outlined,
                          title: 'Terms and Conditions',
                          onTap: () {}),
                      CustomListTile(
                          icon: Icons.policy, title: 'FaQ', onTap: () {}),
                      CustomListTile(
                          icon: Icons.support,
                          title: 'Support Us',
                          onTap: () {}),
                      CustomListTile(
                          icon: Icons.help, title: 'Help', onTap: () {}),
                      CustomListTile(
                          icon: Icons.logout,
                          title: 'Logout',
                          onTap: () {
                            BlocProvider.of<ProfileBloc>(context)
                                .add(LogoutEvent());
                          }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
