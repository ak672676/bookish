import 'package:breview/models/reviewer.dart';
import 'package:breview/pages/home_tab.dart';
import 'package:breview/screens/authenticate/register_page.dart';
import 'package:breview/screens/wrapper.dart';
import 'package:breview/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Reviewer>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Wrapper(),
      ),
    );
  }
}
