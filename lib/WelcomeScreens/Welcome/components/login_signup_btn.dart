import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
                backgroundColor: kPrimaryLightColor, elevation: 5),
            child: Text(
              "Log in".toUpperCase(),
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), //espaco entre os dois botoes

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
              backgroundColor: kPrimaryLightColor, elevation: 5),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ],
    );
  }
}
