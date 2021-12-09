import 'package:breview/widgets/FilledButton.dart';
import 'package:breview/widgets/UserDetailstInputText.dart';
import 'package:flutter/material.dart';

class CreateBlog extends StatefulWidget {
  CreateBlog({Key key}) : super(key: key);

  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
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
              title: Text('Post something New'),
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
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //     fit: BoxFit.scaleDown,
                                    //     //     //     image: Image.asset(
                                    //     //     //       'assets/images/profile_image.png',
                                    //     //     //     ).image,
                                    //     alignment: Alignment.topCenter),
                                    )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6)),
                              width: MediaQuery.of(context).size.width,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.black45,
                              ),
                            ),
                            UserDetailsInputText(
                              textEditingController: firstNameController,
                              labelText: "Blog Title",
                              hintText: "Blog Title",
                            ),
                            UserDetailsInputText(
                              textEditingController: lastNameController,
                              labelText: "Caption",
                              hintText: "Caption (Details)",
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 8,
                            ),
                            FilledButton(
                              listener: () {
                                if (formKey.currentState.validate()) {}
                                print(lastNameController.text);
                                print("Posted");
                              },
                              text: "Post",
                            )
                          ]),
                    ),
                  )),
            )));
  }
}
