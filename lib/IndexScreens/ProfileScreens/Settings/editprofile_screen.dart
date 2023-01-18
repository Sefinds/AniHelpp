import 'package:flutter/material.dart';
import '../../../backend/providers/user_provider.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: kPrimaryColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                            );
                          },
                            child: const Icon(
                                Icons.edit, color: Colors.white
                            )),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 35),
              buildTextField("Full Name", user.name, false),
              buildTextField("E-mail", user.email, false),
              buildTextField("Password", "**********", true),
              buildTextField("Location", "Porto, Portugal", false),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: kPrimaryLightColor, elevation: 5
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: kPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                    ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: kPrimaryLightColor),
                      ),
                      onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera),
              label: const Text('Camera'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.image),
              label: const Text('Gallery'),
            ),
          ],
        )
      ]),
    );
  }


  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: kPrimaryColor,
                  ),
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: kPrimaryColor,
            ),
          ),
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
