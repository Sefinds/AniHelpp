import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import '../../../backend/models/associacoes.dart';
import '../../DonateScreens/donate_screen.dart';


class AssociacaoDetelhes extends StatelessWidget {
  final Asso assos;
  const AssociacaoDetelhes(this.assos, {Key? key}) : super(key: key);

  //static const routeName = "/associacao";
  @override
  Widget build(BuildContext context) {

    return Container(
      //width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(assos.logoasso),
          repeat: ImageRepeat.repeat
         //fit: BoxFit.cover,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        extendBodyBehindAppBar: true,

        body: ListView(
          children: [
            //container para dividir a parte de cima clara com a parte escura
            Container(
              height: 100,
            ),
            const SizedBox(height: 20),

            //conteiner com titulo e subtitulo, com shadow para destacar
            Container(
              height: 130,
              decoration: BoxDecoration(
                boxShadow: [ BoxShadow(
                    blurRadius: 25,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.6),
                ),
                ],
              ),
              child: AssoHeadline(assos),
            ),

            //O container que se mexe com as informacoes todas
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [ BoxShadow(
                    blurRadius: 5, spreadRadius: 5, color: Colors.grey
                ),],
                color: kPrimaryLightColor,
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // SizedBox(height: 20),
                    const Text("About us: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500
                      ),),
                    const SizedBox(height: 15),
                    SizedBox(
                      //width:  220,
                      child: Text(assos.aboutasso,
                        /*maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,*/
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),


                    const SizedBox(height: 25,),
                    const Text("Some a lost of explication and idk \n\nblablablabalbalbalbalabla"
                        "bakbakbakbakabkabkabakbakabkabakbakabkabakbakabkabakbakabka"
                        "bakkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
                        "bkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                        "akbbbbbbbbbbbbbbbbbbbbbb"),
                    const SizedBox(height: 25,),

                    const Text("Contact us: "),
                    const SizedBox(height: 10,),
                    Text(assos.contactasso),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Donate(assos)));

          },
          label: const Text('DONATE'),
          icon: const Icon(Icons.thumb_up),
          backgroundColor: kPrimaryColor,
        ),

      ),
    );
  }
}


class AssoHeadline extends StatelessWidget {
  final Asso assos;
  const AssoHeadline(this.assos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            assos.nameasso,
            style: const TextStyle(
              fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            assos.sloganasso,
            style: const TextStyle(
              fontSize: 18,
                  color: Colors.white,
                  height: 1.25,
              fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
