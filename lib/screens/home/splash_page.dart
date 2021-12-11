import 'dart:async';
import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/provider/LoginProvider.dart';
import 'package:breview/screens/authenticate/phone_login_page.dart';

import 'package:breview/screens/home/home_tab.dart';
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription _streamSubscription;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    LoginProvider.instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1000), () {
      checkLoginStatus(_scaffoldKey.currentContext);
    });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash.png",
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Breview",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Colors.amber[800]),
                    ),
                  ],
                ),
              ))),
    );
  }

  void checkLoginStatus(BuildContext Navcontext) {
    _streamSubscription = LoginProvider.stateStream.listen((state) {
      if (state == PhoneAuthState.Failed || state == PhoneAuthState.newUser) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(_scaffoldKey.currentContext)
              .pushReplacement(FadeRoute(page: PhoneLoginScreen()));
          // Navigator.of(_scaffoldKey.currentContext)
          //     .pushReplacement(FadeRoute(page: CreateReview()));
        });
      }
      if (state == PhoneAuthState.Verified) {
        Future.delayed(Duration(seconds: 1), () {
          // Navigator.of(_scaffoldKey.currentContext)
          //     .pushReplacement(FadeRoute(page: PhoneLoginScreen()));
          Navigator.of(Navcontext).pushReplacement(FadeRoute(page: HomeTab()));
        });
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _streamSubscription = null;
    super.dispose();
  }
}
