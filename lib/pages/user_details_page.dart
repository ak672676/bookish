import 'package:breview/widgets/FilledButton.dart';
import 'package:breview/widgets/UserDetailstInputText.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  UserDetailsPage({Key key}) : super(key: key);

  @override
  _UserDetailsPageState createState() =>
      _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              backgroundColor: Colors.black,
              automaticallyImplyLeading: true,
              title: Text('Create Profile'),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: Image.asset(
                                        'assets/images/profile_image.png',
                                      ).image,
                                      alignment: Alignment.topCenter),
                                )),
                            UserDetailsInputText(
                              textEditingController: firstNameController,
                              labelText: "First Name",
                              hintText: "Your First Name",
                            ),
                            UserDetailsInputText(
                              textEditingController: lastNameController,
                              labelText: "Last Name",
                              hintText: "Your Last Name",
                            ),
                            UserDetailsInputText(
                              textEditingController: emailController,
                              labelText: "Email",
                              hintText: "Your Email",
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 8,
                            ),
                            FilledButton(
                              listener: () {
                                if (formKey.currentState.validate()) {}
                                print(lastNameController.text);
                                print("Clicked");
                              },
                              text: "Finish",
                            )
                          ]),
                    ),
                  )),
            )));
  }
}
