import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import '../../../backend/models/news.dart';


class NewsDetailsScreen  extends StatelessWidget {
  final New newse;
  const NewsDetailsScreen(this.newse);

  //static const routeName = "/associacao";
  @override
  Widget build(BuildContext context) {

    return Container(
      //width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(newse.img),
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
              color: Colors.white,
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
              height: 150,
            ),
            const SizedBox(height: 20),

            //conteiner com titulo e subtitulo, com shadow para destacar
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [ BoxShadow(
                    blurRadius: 25,
                    spreadRadius: 1,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  ],
                ),
                child: TopHeadline(newse),
              ),
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
                    blurRadius: 5, spreadRadius: 5, color: Colors.grey,
                ),],
                color: kPrimaryLightColor,
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person),
                        //const Text("From "),
                        const Text("By ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          newse.source,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        const Icon(Icons.date_range),
                        SizedBox(
                          child: Text(
                            newse.date,
                            style: const TextStyle(
                              fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 25,),
                    // SizedBox(height: 20),
                    Text(newse.subtitle,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500
                      ),),
                    const SizedBox(height: 15),
                    SizedBox(
                      //width:  220,
                      child: Text(newse.news,
                        /*maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,*/
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}


//o topo com o titulo
class TopHeadline extends StatelessWidget {
  final New newse;
  const TopHeadline(this.newse);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newse.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

