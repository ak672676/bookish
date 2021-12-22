import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/provider/LoginProvider.dart';
import 'package:breview/screens/authenticate/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhoneLoginScreen extends StatefulWidget {
  PhoneLoginScreen({Key key}) : super(key: key);

  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _visibilityKey = GlobalKey();
  final _focusNode = FocusNode();
  bool _visibility = true;
  var provider;
  String phone;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final spinKit = SpinKitThreeBounce(
    color: Color(0xFFFFF500),
    size: 30,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              alignment: Alignment.topCenter,
              image: Image.asset(
                'assets/images/otpImage.png',
              ).image,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFF191817),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFDBE2E7),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  onChanged: (value) {
                                    phone = value;
                                  },
                                  onFieldSubmitted: (value) {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        _visibility = false;
                                      });
                                      // startPhoneAuth(phone, context);
                                      print("Next");
                                    }
                                  },
                                  focusNode: _focusNode,
                                  validator: (value) {
                                    if (value.length != 10) {
                                      return "Invalid mobile number ";
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.amber[600],
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.amber[600],
                                        width: 2.0,
                                      ),
                                    ),
                                    label: Text(
                                      'Phone Number',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _visibility = false;
                                  });
                                  startPhoneAuth(phone, context);
                                  print("Next");
                                }
                              },
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber[700]),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  startPhoneAuth(String phone, BuildContext navcontext) {
    LoginProvider.startAuth(phoneNumber: "+91" + phone);
    LoginProvider.stateStream.listen((state) {
      if (state == PhoneAuthState.CodeSent) {
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacement(SlideRightRoute(page: OTPPage()));
      }
      if (state == PhoneAuthState.Failed) {
        debugPrint("Seems there is an issue with it");
        // Navigator.of(_scaffoldKey.currentContext)
        //     .pushReplacement(SlideRightRoute(page: PhoneLoginScreen()));
      }
    });
  }
}
