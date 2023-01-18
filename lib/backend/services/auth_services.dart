import 'dart:convert';
import 'package:flutter_auth/WelcomeScreens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/backend/providers/user_provider.dart';
import 'package:flutter_auth/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import 'package:flutter_auth/IndexScreens/nav_screens.dart';


class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String passwordConfirm,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          email: email,
          passwordConfirm: passwordConfirm,
          token: '',
          );


      //final String url = 'https://anihelp-api.onrender.com/api/signup';

      http.Response response = await http.post(
        Uri.https('anihelp-api.onrender.com', 'api/signup'),
       // Uri.parse('${Constants.uri},api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            },
          );

      print(response);

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
              context,
              "Account created! Login with the same credentials!",
          );
        },
      );

    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }


  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
}) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response response = await http.post(
        Uri.https('anihelp-api.onrender.com', 'api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {

         SharedPreferences prefs = await SharedPreferences.getInstance();
         userProvider.setUser(response.body);
         //await prefs.setString('x-auth-token', jsonEncode(response.body)["token"]);
        // prefs.setString("user", jsonEncode(token));
         await prefs.setString('x-auth-token', jsonDecode(response.body)["token"]);
         print(response.body);

         navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const NavScreens(),
              ),
              (route) => false
          );

        },
      );

    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
        BuildContext context,
      ) async {
        try{
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString('x-auth-token');

          if (token == null) {
            prefs.setString('x-auth-token', '');
          }

          var tokenRes = await http.post(
            Uri.https('anihelp-api.onrender.com', '/tokenIsValid'),
            headers: <String, String> {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token!,
            },
          );

        var response = jsonDecode(tokenRes.body);

        if (response == true) {
          http.Response userRes = await http.get(
            Uri.https('anihelp-api.onrender.com', '/'),
            headers: <String, String> {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token,
            },
          );

          userProvider.setUser(userRes.body);
        }

        } catch (e) {
          showSnackBar(context, e.toString());
        }
      }

      void signOut(BuildContext context) async {
        final navigator = Navigator.of(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('x-auth-token', '');
        navigator.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const WelcomeScreen()
            ),
                (route) => false
        );
      }

}

