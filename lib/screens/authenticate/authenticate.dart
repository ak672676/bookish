// import 'package:brew_crew/screens/authenticate/register.dart';
// import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:breview/screens/authenticate/phone_login_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return PhoneLoginScreen();
      // return PhoneloginWidget(toggleView: toggleView);

    } else {
      return PhoneLoginScreen();
    }
  }
}
