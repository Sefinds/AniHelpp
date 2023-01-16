import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            //fontFamily: 'Open Sans',
          ),
        ),
        const SizedBox(height: defaultPadding* 2),
        Row(
          children: [
            const Spacer(),
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
        const SizedBox(height: defaultPadding * 3),
      ],
    );
  }
}
