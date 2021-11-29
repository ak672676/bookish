import 'package:breview/pages/friends_list_page.dart';
import 'package:breview/pages/friends_profile_page.dart';
import 'package:breview/pages/home_page.dart';
import 'package:breview/pages/home_tab.dart';
import 'package:breview/pages/otp_page.dart';
import 'package:breview/pages/phone_login_page.dart';
import 'package:breview/pages/test_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: FriendsWidget(),
      // home: TestPage(),
      // home: HomeTab(),
      // home: MainPageWidget(),
      // home: FriendProfileWidget(),
      // home: PhoneloginWidget(),
      home: OTPPageWidget(),
      // home: PhoneAuthForm(),
      // home: MyHomePage(title: 'Flutter Demo Home Page '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var phoneNumberController = TextEditingController();
  var otpController = TextEditingController();

  String verificationId = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  void signInWithPhoneAuthCredentials(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeTab()));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                hintText: 'Enter valid number'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: otpController,
            decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
                hintText: 'Enter valid OTP'),
          ),
        ),
        TextButton(
            onPressed: () {
              fetchOtp();
            },
            child: Text('Send OTP')),
        TextButton(
            onPressed: () {
              verify();
            },
            child: Text('Verify')),
      ]),
    );
  }

  Future<void> fetchOtp() async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('Invalid Phone Number');
          }
        },
        codeSent: (String verificationId, int forceResendingToken) async {
          print('Code Sent');
          this.verificationId = verificationId;
          // Navigator.push(context, MaterialPageRoute(builder: (context) => OTPPage(verificationId: verificationId,)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verificationId,
        smsCode: otpController.text.toString());
    // await auth.signInWithCredential(phoneAuthCredential);
    signInWithPhoneAuthCredentials(phoneAuthCredential);
  }
}
