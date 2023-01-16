import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';

class HeaderWithSearchBox extends StatefulWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderWithSearchBox> createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      SizedBox(
        //vai usar 20% da nossa altura total
        height: widget.size.height * 0.13, //tamanho da appbar para searchbar
        child: Stack(
          children: <Widget>[

            Container( //tamanho e estilo do texto e placa verde
              height: widget.size.height * 0.2 - 100,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
              ),
            ),

            Positioned( //posicao e estilo da barra de pesquisa
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          //suffix nao funciona bem com SVG por iso usamos ROW
                          //suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    ],
    );
  }
}