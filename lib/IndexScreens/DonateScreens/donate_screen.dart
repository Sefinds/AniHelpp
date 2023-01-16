import 'package:flutter/material.dart';
import '../../backend/models/associacoes.dart';
import '../../constants.dart';


class Donate extends StatefulWidget {

  final Asso assos;
  const Donate(this.assos, {Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List<String> item = [];
  late String temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Donate",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(left: 26, right: 26, top: 25),
        child: ListView(
          children: [
            const SizedBox(height: 15),

            Row(
              children: const <Widget>[
                Text(
                  "You are supporting ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Animal cruelty!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Row(
              children:  <Widget>[
                const Text(
                  "Your donation goes to ",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  widget.assos.nameasso,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 50),

            Row(
              children: const [
                Icon(Icons.stars, color: kPrimaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Enter value",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(height: 10),
            TextFormField(
              //controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide( width: 3, color: kPrimaryColor ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "10",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.euro),
                ),
              ),
            ),

            const SizedBox(height: 5),
            Row(
              children: const [
                MyStatefulWidget(),
                Text("I donate monthly", style: TextStyle(fontSize: 15),),
               // const Icon(Icons.star, color: kPrimaryColor,)
              ],
            ),

            const SizedBox(height: 70),
            Row(
              children: const [
                Icon(Icons.payment, color: kPrimaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Payment method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 5,
            ),


            const AddCard(),

            const SizedBox(height: 45),
            Row(
              children: const [
                MyStatefulWidget(),
                Text("Stay anonymous at the campaign",
                  style: TextStyle(fontSize: 15),),
              ],
            ),


            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  maximumSize: const Size(double.infinity, 56),
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: kPrimaryColor, elevation: 5),
              onPressed: () {
              },
              child: const Text(
                "Complete Transaction",
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
         /*   Column(
              children: [
                ListView(
                    shrinkWrap: true,
                    children: item.map( (element) => Text(element) ).toList()),
                TextField(
                  maxLength: 20,
                  onChanged: (str){
                    temp = str;
                  },
                ),
                TextButton(
                    onPressed: (){
                      setState(() {
                        item.add(temp);
                      });
                    },
                    child: Text("Add card"),
                ),
              ],
            )*/


          ],
        ),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return kPrimaryColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}




enum SingingCharacter { apple, google, addcard }
class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);


  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  SingingCharacter? _character = SingingCharacter.apple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: Row(
             children: const [
               Expanded(flex: 3, child: Text('Apple Pay'),),
               Expanded(flex:1, child: InkWell(child: Icon(Icons.apple),))
             ],
          ),
          value: SingingCharacter.apple,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Row(
            children: const [
              Expanded(flex: 3, child: Text('Google play'),),
              Expanded(flex:1, child: InkWell(child: Icon(Icons.g_mobiledata),))
            ],
          ),
          value: SingingCharacter.google,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),


        RadioListTile<SingingCharacter>(
          title: Row(
            children: const [
              Expanded(flex: 3, child: Text('Add Card'),),
              Expanded(flex:1, child: InkWell(child: Icon(Icons.add_card_outlined),))
            ],
          ),
          value: SingingCharacter.addcard,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
           // acrestt
          },
        ),

      ],
    );
  }
}
