import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              TextFormField(
                // controller: phoneNumberController,
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Color(0xFF95A1AC),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF95A1AC),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.amber[600],
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.amber[600],
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  // fillColor: Colors.white,

                  contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Gender",
                      style: TextStyle(
                        color: Colors.amber[600],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  Column(children: [
                    Row(children: [
                      SizedBox(
                        width: 10,
                        child: Radio(
                          value: 'male',
                          groupValue: gender,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            //value may be true or false
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 10,
                        child: Radio(
                          value: 'female',
                          groupValue: gender,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            //value may be true or false
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ]),
                ],
              ),
              SizedBox(height: 40),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.amber[600],
                ),
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber[600],
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(1969, 1, 1),
                    backgroundColor: Colors.black,
                    onDateTimeChanged: (DateTime newDateTime) {
                      print(newDateTime);
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  print('OTP Button pressed ...');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber[700]),
                ),
              )
            ],
          ),
        ));
  }
}
