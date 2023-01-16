import 'package:flutter/material.dart';
import 'package:flutter_auth/WelcomeScreens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/backend/providers/user_provider.dart';
import 'package:flutter_auth/constants.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'IndexScreens/HomeScreens/Home/home_screen.dart';
import 'WelcomeScreens/Login/login_screen.dart';
import 'WelcomeScreens/Signup/signup_screen.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider()),
          ],
          child: const MyApp()
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anihelp',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
          //scaffoldBackgroundColor: Colors.green[400],
          // style do butao de login, logout
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: kBackgroundColor,
              shape: const StadiumBorder(),
            ),
          ),
          //style das caixas input no login e logout
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),

      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signin': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
      //home: const WelcomeScreen(),
    );
  }
}
