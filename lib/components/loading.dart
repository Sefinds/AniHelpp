import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),*/
        Container(
          child: Lottie.network(
            'https://lottie.host/156842c0-da71-45de-bc5b-ba1d17d318de/O6G1CJqbf4.json',
          //  'https://assets5.lottiefiles.com/packages/lf20_jjifcy6b.json',
            width: 250,
            height: 250,
          ),
          //Lottie.asset('assets/loading.json'),
        ),
        const Text('Loading ...',
          style: TextStyle(
            fontSize: 16.0,
          ),),
      ],
    );
  }
}



