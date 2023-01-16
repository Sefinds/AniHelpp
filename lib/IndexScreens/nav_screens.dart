import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_auth/IndexScreens/HomeScreens/Home/home_screen.dart';
import 'package:provider/provider.dart';

import '../backend/providers/user_provider.dart';
import '../constants.dart';
import 'AssociacoesScreens/associacoes_screen.dart';
import 'ProfileScreens/profile_screen.dart';
//import 'navbar_key.dart';

class NavScreens extends StatefulWidget {
  const NavScreens({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavScreens createState() => _NavScreens();
}

class _NavScreens extends State<NavScreens> {
  int selectedIndex = 1;
  final screen = [const AssociacoesScreen(), const HomeScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        //key: NavbarKey.getKey(),
        items: const [
          Icon(Icons.favorite, color: kPrimaryLightColor, size: 28),
          Icon(Icons.home, color: kPrimaryLightColor, size: 28),
          Icon(Icons.person, color: kPrimaryLightColor, size: 28)
        ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        backgroundColor: Colors.transparent, //cor de tras do icon
        color: kPrimaryColor, //cor da navbar
        height: 52,       //tamanho da navbar
        animationDuration: const Duration(milliseconds: 400), //tempo de mudar de um icon pro outro
      ),
      body: screen[selectedIndex],
    );
  }
}

