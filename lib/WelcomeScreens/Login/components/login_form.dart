import 'package:flutter/material.dart';
//import 'package:flutter_auth/IndexScreens/nav_screens.dart';
import '../../../backend/services/auth_services.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signInUser(){
    authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text
    );
  }


  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: globalFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),

            //input password
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),

            //input button login
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: signInUser,
               /* onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NavScreens();
                      },
                    ),
                  );
                },*/
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: kPrimaryLightColor, elevation: 5),
                child: Text(
                  "Login".toUpperCase(),
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
            const SizedBox(height: defaultPadding),
            //text para mudar pra sign up
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );
  }
}
