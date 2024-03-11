import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app/Controller/Auth/auth_bloc.dart';
import 'package:movieapp/app/Screens/Auth/widgets/custom_text_field.dart';
import 'package:movieapp/app/Screens/Auth/widgets/validator.dart';
import 'package:movieapp/app/utils/colors.dart';
import 'package:movieapp/app/utils/images.dart';

import '../../Home/Bottompage/bottom_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
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
              child: Image.asset(
                AppAssets.signuppage,
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
                height: 450,
                child: SingleChildScrollView(
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
                                'Let’s get started',
                                style: TextStyle(
                                  color: AppColors.kWhite,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'SignUp Your Account',
                                style: TextStyle(
                                    color: AppColors.kWhite, fontSize: 16),
                              ),
                              const SizedBox(height: 38),
                              CustomTextField(
                                controller: _nameController,
                                labelText: 'Username',
                                obscureText: false,
                                validator: nameValidate,
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: _emailController,
                                labelText: 'Email',
                                obscureText: false,
                                validator: emailValidate,
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: _passwordController,
                                labelText: 'Password',
                                obscureText: true,
                                validator: PasswordValidate,
                              ),
                              const SizedBox(height: 32),
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
                                      String name = _nameController.text;
                                      String email = _emailController.text;
                                      String password = _passwordController.text;
                                      BlocProvider.of<AuthBloc>(context).add(
                                          SignUpEvent(
                                              name: name,
                                              email: email,
                                              password: password));
                                    }
                                  },
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    " Log in",
                                    style: TextStyle(color: AppColors.kWhite),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
