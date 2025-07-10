import 'package:flutter/material.dart';
import 'package:spotify_app/common/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/buttons/basic_button.dart';
import 'package:spotify_app/core/configs/assets/app.vectors.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/domain/usecases/auth/singin.dart';
import 'package:spotify_app/presentation/auth/pages/register.dart';
import 'package:spotify_app/presentation/root/pages/root.dart';
import 'package:spotify_app/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Image.asset(AppVectors.spotifyLogo, height: 100, width: 100),
      ),
      bottomNavigationBar: _registerRoute(context),
      body: SingleChildScrollView(
        child: Padding(
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
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                      email: _email.text.toString(),

                      password: _password.text.toString(),
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => RootPage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                title: 'Sign In',
              ),
            ],
          ),
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
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      controller: _password,
      obscureText: true,
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
