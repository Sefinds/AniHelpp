import 'package:flutter/material.dart';

import '../../../constants.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({Key? key}) : super(key: key);

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
          "Help & Support",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 120, top: 25),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EditProfileScreen();
                  },
                ),
              );*/
              },
              child: buildAccountOption(
                  context,"idk"
              ),
            ),

          ],
        ),
      ),

    );
  }


  Padding buildAccountOption(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
