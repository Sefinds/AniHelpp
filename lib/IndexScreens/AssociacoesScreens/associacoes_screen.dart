import 'dart:convert';
import 'package:flutter/material.dart';
import '../../backend/models/associacoes.dart';
import '../../components/loading.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'components/associacao_detalhes.dart';
import 'package:flutter/foundation.dart';

//converter JSON data para lista de associacoes
List<Asso> parseAsso(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var asso = list.map((e) => Asso.fromJson(e)).toList();
  return asso;
}

//receber resposta da api das asso.
Future<List<Asso>> fetchAssos() async{
  final response = await http.get(Uri.https('anihelp-api.onrender.com', '/api/asso'));

  if (response.statusCode == 200) {
    return compute(parseAsso,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}


class AssociacoesScreen extends StatefulWidget {
  const AssociacoesScreen({Key? key}) : super(key: key);

  @override
  State<AssociacoesScreen> createState() => _AssociacoesScreenState();
}

class _AssociacoesScreenState extends State<AssociacoesScreen> {

  final List<Asso> _asso = <Asso>[];
  List<Asso> _assoDisplay = <Asso>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAssos().then((value) {
      setState(() {
        _isLoading = false;
        _asso.addAll(value);
        _assoDisplay = _asso;
        //print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "Discover associations",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "SFPro"),
        ),
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isLoading) {
                return index == 0 ? _searchBar() : UserTile(asso: _assoDisplay[index - 1]);
              } else {
                return const LoadingView();
              }
            },
            itemCount: _assoDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _assoDisplay = _asso.where((u) {
              var fName = u.nameasso.toLowerCase();
            //  var lName = u.lastName.toLowerCase();
            //  var job = u.job.toLowerCase();
              return fName.contains(searchText) ;//|| lName.contains(searchText) || job.contains(searchText)
            }).toList();
          });
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  width: 1,
                //  style: BorderStyle.none,
                color: kPrimaryColor
              )
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search associations',
          fillColor: Colors.white,
        ),
      ),
    );
  }
}



class UserTile extends StatelessWidget {
  final Asso asso;

  const UserTile({Key? key, required this.asso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AssociacaoDetelhes(asso)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(asso.logoasso),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: const [ BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey),
                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 220,
                        child: Text(
                          asso.nameasso,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),
                      SizedBox(
                        width: 280,
                        child: Text(
                          asso.sloganasso,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}