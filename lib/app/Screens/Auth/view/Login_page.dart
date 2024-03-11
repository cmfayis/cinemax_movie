import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Screens/Auth/view/Sign_page.dart';
import 'package:movieapp/app/Screens/Auth/widgets/custom_text_field.dart';
import 'package:movieapp/app/Screens/Home/Bottompage/bottom_page.dart';
import 'package:movieapp/app/utils/colors.dart';
import 'package:movieapp/app/utils/images.dart';

import '../../../Controller/Auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpPageState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          }
          if (state is SignUpState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavigatonPage()));
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Image.asset(
                AppAssets.kOnboardingSecond,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.6), // Change this to desired color
                    borderRadius: BorderRadius.circular(28)),
                width: double.infinity,
                height: 440,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: AppColors.kWhite,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Login to continue',
                              style: TextStyle(
                                  color: AppColors.kWhite, fontSize: 18),
                            ),
                            const SizedBox(height: 48),
                            CustomTextField(
                              controller: _emailController,
                              labelText: 'Email',
                              obscureText: false,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _passwordController,
                              labelText: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot PassWord?',
                                    style: TextStyle(color: AppColors.kWhite),
                                  )),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.kPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String email = _emailController.text;
                                    String password = _passwordController.text;
                                    BlocProvider.of<AuthBloc>(context).add(
                                        LoginEvent(
                                            email: email, password: password));
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Align(
                              child: TextButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(SignUpPageEvent());
                                  },
                                  child: const Text(
                                    " Don't have an account  Creat Here",
                                    style: TextStyle(color: AppColors.kWhite),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
