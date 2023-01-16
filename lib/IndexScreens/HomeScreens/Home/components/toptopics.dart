import 'package:flutter/material.dart';

class TopTopics extends StatelessWidget {
  final double money; //dinheiro
  final String titulo; //titulo
  final String subtitulo; //titulo
  final color; //cor do topico

  const TopTopics({
    Key? key,
    required this.money,
    required this.titulo,
    required this.subtitulo,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          //meter no canto do fim o target
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titulo.toString() ,
                textAlign: TextAlign.right,
                style:const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitulo.toString(),
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.white, fontSize: 17 ),
              ),
            ),

            const SizedBox(height: 35),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Target",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '€$money',
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
