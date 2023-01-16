import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../components/loading.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;
import '../../../backend/models/news.dart';
import '../newdetail/newdetail_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:percent_indicator_example/sample_linear_page.dart';

//imagens que aparecem no topo de top news
final List<String> imgList = [
  'https://images.unsplash.com/photo-1610528519769-8dd585a4226d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
  'https://images.unsplash.com/photo-1471119115842-96070c40566d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80',
  'https://images.unsplash.com/photo-1531214141683-bdcc6c193522?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
  'https://images.unsplash.com/photo-1610528020328-5ce7917f04f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
  'https://images.unsplash.com/photo-1654299350894-3fe937b38228?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80',
  'https://images.unsplash.com/photo-1600297665527-772c69a12e6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
];

//style e texto interior do container de top news
final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(100, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),

                    /*boxShadow: [BoxShadow(
                          blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey
                    )],*/
                  ),
                  padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("nome da asso",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                          Row(
                            children: [
                              LinearPercentIndicator(
                                barRadius: Radius.circular(16),
                                lineHeight: 7,
                                width: 180,
                                percent: 0.5,
                                progressColor: kPrimaryColor,
                                backgroundColor: kPrimaryLightColor,
                              ),
                              const Text("1.7000 €",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          //const Text("1.7000 €")
                    ],
                  ),


                /*  child: Text(
                    'No. ${imgList.indexOf(item)} imagen',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/

                ),
              ),
            ],
          )),
    ))
    .toList();


//inicio da widget principal da pagina
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //connectar a api das news e chamar de news.dart
  Future<List<New>> newsFuture = getNews();

  static Future<List<New>> getNews() async{
    final response = await http.get(Uri.https('anihelp-api.onrender.com', '/api/news'));

    final body = json.decode(response.body);
    return body.map<New>(New.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                //tudo esta dentro da silverappbar para fazer o slide especifico para cima
                SliverAppBar(
                  //parte fixa no topo (neste caso o titulo)
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: kPrimaryLightColor,
                  title: const Text(
                    "AniHelp",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  expandedHeight: 350,
                  pinned: true,
                  floating: true,

                  //flexivelspace é o que vai desaparecer ao fazer scroll para cima na sliverappbar
                  flexibleSpace: Container(
                    padding: const EdgeInsets.only(top: 90),
                    child: CarouselSlider( //carroselslider é o efeito de mexer paar o lado dos conteiners que criamos em cima dos tops
                      options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 7), //o tempo que demora para mudar para o proximo
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imageSliders, //vai buscar o que defenimos em cima (o que esta no container)
                    ),
                  ),

                  //bottom é a parte debaixo da sliverappbar que se vai mexer depois para cima e fica preso numa parte especifica
                  bottom:
                  const TabBar( //categorias das news que dao scroll para o lado
                    isScrollable: true,
                    indicatorColor: kPrimaryColor,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                          child: Text(
                            'Latest News',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 16.5),
                          )),
                      Tab(
                          child: Text(
                            'Trending News',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 16.5),
                          )),
                      Tab(
                          child: Text(
                            'Healthy Living',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 16.5),
                          )),
                      Tab(
                          child: Text(
                            'Industry News',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 16.5),
                          )),
                      Tab(
                          child: Text(
                            'Featured Animals',
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 16.5),
                          )),
                    ],
                  ),
                ),
              ];
            },

            //o body da wiget principal da pagina - onde vamos declarar as noticias
              // tabBarView declara os 5 topicos de noticias que ficam dentro de uma Listview
              //FutureBuilder vai conectar a data da api no news.dart e se aceder continua para a
              // widget da buildnews se nao ou se demorara a aparecer aparece a mensagem "No acess to news data"
            body: TabBarView(
              children: [
                   FutureBuilder<List<New>>(
                        future: newsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final news = snapshot.data!;

                            return buildNews(news);
                          } else {
                            return const LoadingView();
                          }
                        },
                      ),


                   FutureBuilder<List<New>>(
                    future: newsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final news = snapshot.data!;

                        return buildNews(news);
                      } else {
                        return const LoadingView();
                      }
                    },
                  ),


                  FutureBuilder<List<New>>(
                    future: newsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final news = snapshot.data!;

                        return buildNews(news);
                      } else {
                        return const LoadingView();
                      }
                    },
                  ),

                   FutureBuilder<List<New>>(
                    future: newsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final news = snapshot.data!;

                        return buildNews(news);
                      } else {
                        return const LoadingView();
                      }
                    },
                  ),

                   FutureBuilder<List<New>>(
                    future: newsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final news = snapshot.data!;

                        return buildNews(news);
                      } else {
                        return const LoadingView();
                        //return const Text("No acess to news data");
                      }
                    },
                  ),
              ]
            )

          ),
      ),
    );
  }



  // A construcao de uma noticia, feita no ListView para termos possibilidade de fazer
  // um scroll e listar a api uma a uma com a declaracao dela
  Widget buildNews(List<New> news) => ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    itemCount: news.length,
    itemBuilder: (context, index) {
      New newse = news[index];

      return Container(
        height: 150,
        child: Card(
              child: ListTile(
                visualDensity: VisualDensity(vertical: 4),
                leading: Container(
                  width: 120,
                  height: 180,
                  child: SizedBox(
                      child: Image.network(
                        newse.img,
                        fit: BoxFit.cover,
                      )
                  ),
                ),

                title: SizedBox(
                    child: Text(
                     // news[index].title,
                      newse.title,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
            ),

                subtitle: SizedBox(
                  child: Text(
                    //news[index].title,
                    newse.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                ),

                trailing: const Icon(Icons.more_vert),
                isThreeLine: true,

                //ontap na new especifica, pega nos dados dessa new e faz o autput desses dados na proxima pagina declarada
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(newse)));
                },
            ),
          ),
      );

    },
  );

}

