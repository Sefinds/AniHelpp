import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Welcome to \n ANIHELP",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              //fontFamily: 'Open Sans',
          ),
        ),

        const SizedBox(height: defaultPadding * 4), //espaco entre titulo e logo
        Row(
          children: [
            const Spacer(), //espaco lado esquerdo do logo
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: 204,
                height: 205
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 5), //espaco entre logo e botoes
      ],
    );
  }
}