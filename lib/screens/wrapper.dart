import 'package:breview/models/reviewer.dart';

import 'package:breview/screens/authenticate/authenticate.dart';
import 'package:breview/screens/home/home_tab.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Reviewer>(context);

    // return either the Home or Authenticate widget

    if (user == null) {
      return Authenticate();
    } else {
      print("----> " + user.uid);
      // print("----> " + user.username);
      return HomeTab();
    }
  }
}
