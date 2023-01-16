import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../Settings/settings_screen.dart';

class DonationInformation extends StatelessWidget {
  const DonationInformation({Key? key}) : super(key: key);

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
          "Donation Information",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.wallet,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Payment details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Payment method", "PayPal",
                "Credit card", "Apple Pay"),
            const SizedBox(height: 60),
            Row(
              children: const [
                Icon(Icons.history, color: kPrimaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "History and tax receipts",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.cruelty_free_rounded,
                  size: 100,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Don't donate yet?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Do not worry!",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "You can start immediately! Tap on the button to make an initial donation and help to support animal needs.",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey,),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: kPrimaryColor, elevation: 5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SettingsScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Donate",
                    style: TextStyle(
                        color: kPrimaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildAccountOption(BuildContext context, String title,
    String option1, String option2, String option3) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(option1),
                  Text(option2),
                  Text(option3),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close")),
              ],
            );
          });
    },
    child: Padding(
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
    ),
  );
}
