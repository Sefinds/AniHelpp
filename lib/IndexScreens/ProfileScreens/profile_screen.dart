import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../backend/providers/user_provider.dart';
import '../../constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'DonationInformation/donation_information_screen.dart';
import 'HelpSuport/helpsuport_screen.dart';
import 'Invitefriend/inviteafriend_screen.dart';
import 'Settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    ScreenUtil.init(
      context,
    );

    var profileInfo = Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Username",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 4),
         Text(
          user.email,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 40),
      ],
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        profileInfo,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
              "Profile",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: Column(
          children: <Widget>[
            header,
            Expanded(
              child: ListView(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Colors.white,
                      elevation: 1.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DonationInformation();
                          },
                        ),
                      );
                    },
                    child: const ProfileListItem(
                      icon: LineAwesomeIcons.globe_with_europe_shown,
                      text: "Donation information",
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Colors.white,
                      elevation: 1.5,
                    ),
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
                    child: const ProfileListItem(
                      icon: LineAwesomeIcons.cog,
                      text: "Settings",
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Colors.white,
                      elevation: 1.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const InviteFriends();
                          },
                        ),
                      );
                    },
                    child: const ProfileListItem(
                      icon: Icons.share_outlined,
                      text: "Invite a Friend",
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Colors.white,
                      elevation: 1.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HelpSupport();
                          },
                        ),
                      );
                    },
                    child: const ProfileListItem(
                      icon: LineAwesomeIcons.question_circle,
                      text: "Help & Support",
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: Colors.white,
                      elevation: 1.5,
                    ),
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
                    child: const ProfileListItem(
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: "Logout",
                      hasNavigation: false,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),//espaco entre os icon e texto
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        //color: const Color.fromRGBO(242, 237, 229, 100),
      ),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 27,
            color: kPrimaryColor,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          const Spacer(),
          if (hasNavigation)
            const Icon(
              LineAwesomeIcons.angle_right,
              size: 25,
              color: kPrimaryColor,
            ),
        ],
      ),
    );
  }
}
