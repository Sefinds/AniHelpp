import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key? key}) : super(key: key);

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
          "Share",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 300,
                  height: 340,
                  color: kPrimaryColor,
                  child: const Image(
                    image: NetworkImage("https://images.unsplash.com/photo-1505148230895-d9a785a555fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text(
                "Every support matter!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),

              const Center(
                child: Text(
                  "Every living being in this world deserves love, food and help!"
                " We are here to give people the chance to make a difference and to help.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey,),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: kPrimaryColor, elevation: 5),
                onPressed: () async{
                  final image = SvgPicture.asset(
                      "assets/icons/logo.svg",
                      width: 204,
                      height: 205
                  );

                  await Share.share(
                      "Anihelp! An app that allows you to donate to animals in need,"
                          " and stay up to date on the animal world."
                          " Be a voice for the animals too!");
                },
                child: const Text(
                  "Share",
                  style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }



}
