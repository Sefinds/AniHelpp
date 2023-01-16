//background do login
import 'package:flutter/material.dart';
//import 'package:flutter_auth/constants.dart';

class Background extends StatelessWidget {
  final Widget child;


  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/images/Ellipse.png",
    this.bottomImage = "assets/images/Ellipse1.png",
    this.lateralImage = "assets/images/Ellipse2.png",
  }) : super(key: key);

  final String topImage, bottomImage, lateralImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(82, 95, 65, 0.85),
      //backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                topImage,
                width: 800,
                height: 450
              ),
            ),

             Positioned(
               bottom: -100,
               left: 0,
               child: Image.asset(
                   bottomImage,
                   width: 300,
                   height: 450
               ),
             ),

            Positioned(
              bottom: 100,
              right: -40,
              child: Image.asset(
                  lateralImage,
                  width: 340,
                  height: 650
              ),
            ),

            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
