import 'package:flutter/material.dart';
import 'package:spotify_app/common/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/buttons/basic_button.dart';
import 'package:spotify_app/core/configs/assets/app.vectors.dart';
import 'package:spotify_app/presentation/auth/pages/register.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Image.asset(AppVectors.spotifyLogo, height: 100, width: 100),
      ),
      bottomNavigationBar: _registerRoute(context),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinPage(),
            SizedBox(height: 30),
            _emailField(context),
            SizedBox(height: 15),
            _passwordField(context),
            SizedBox(height: 20),
            BasicAppButton(onPressed: () {}, title: 'Sign In'),
          ],
        ),
      ),
    );
  }

  Widget _signinPage() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
    );
  }

  // Widget _fullNameField(context) {
  //   return TextField(
  //     decoration: InputDecoration(
  //       hintText: 'Full Name',
  //     ).applyDefaults(Theme.of(context).inputDecorationTheme),
  //   );
  // }

  Widget _emailField(context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _registerRoute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member ?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => RegisterPage(),
                ),
              );
            },
            child: Text(
              'Register Now',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
