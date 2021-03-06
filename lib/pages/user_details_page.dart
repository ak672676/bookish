import 'dart:io';

import 'package:breview/models/UserDetails.dart';
import 'package:breview/services/crud.dart';
import 'package:breview/widgets/FilledButton.dart';
import 'package:breview/widgets/UserDetailstInputText.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsPage extends StatefulWidget {
  UserDetailsPage({Key key}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  XFile _image;
  final ImagePicker _picker = ImagePicker();
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
                            SizedBox(
                              height: 100,
                            ),
                            Center(
                                child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Color(0xffFDCF09),
                                  child: _image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.file(
                                            File(_image.path),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image(
                                            fit: BoxFit.fitHeight,
                                            image: Image.asset(
                                              'assets/images/profile_image.png',
                                            ).image,
                                          ),
                                        )),
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
                                if (_image == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Choose a Profile Picture",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ));
                                  return;
                                }
                                if (formKey.currentState.validate()) {}
                                print(lastNameController.text);
                                print("Clicked");
                                CrudMethods.saveUserData(
                                    File(_image.path), new UserDetails());
                              },
                              text: "Finish",
                            )
                          ]),
                    ),
                  )),
            )));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  _imgFromGallery() async {
    XFile image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }
}
