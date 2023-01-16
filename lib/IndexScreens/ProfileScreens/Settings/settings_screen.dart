import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'editprofile_screen.dart';
//import '../profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
          "Settings",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: ListView(
          children: [
            //Account settings
            const SizedBox(height: 40),
            Row(
              children: const [
                Icon(Icons.person, color: kPrimaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
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

            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const EditProfileScreen();
                      },
                    ),
                  );
                },
                child: buildAccountOption(
                    context, "Edit Profile"
                ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditProfileScreen();
                    },
                  ),
                );
              },
              child: buildAccountOption(context, "Contend settings"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditProfileScreen();
                    },
                  ),
                );
              },
              child: buildAccountOption(context, "Social"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditProfileScreen();
                    },
                  ),
                );
              },
              child: buildAccountOption(context, "Language"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditProfileScreen();
                    },
                  ),
                );
              },
              child: buildAccountOption(context, "Privacy and security"),
            ),


            //Notification settings
            const SizedBox(height: 40),
            Row(
              children: const [
                Icon(Icons.volume_up_outlined, color: kPrimaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notification",
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
            buildNotification("New for you", true),
            buildNotification("Account activity", true),
            buildNotification("Opportunity", false),
          ],
        ),
      ),
    );
  }

  Row buildNotification(String title, bool isActive) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[600]),
              ),
              Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: isActive,
                    onChanged: (bool val) {},
                  ))
            ],
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
