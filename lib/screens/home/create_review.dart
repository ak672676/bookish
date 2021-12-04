import 'dart:io';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({Key key}) : super(key: key);

  @override
  _CreateReviewState createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  File imgFile;
  final imgPicker = ImagePicker();

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery.path);
    });
    print(imgFile);
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imgFile, width: 350, height: 350);
    }
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Capture Image From Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Create Review"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  child: () {
                    if (imgFile == null) {
                      return Icon(
                        Icons.add_a_photo,
                        size: 70,
                        color: Colors.amber[400],
                      );
                    } else {
                      // return Image.network(
                      //   "https://5.imimg.com/data5/WC/ML/MY-68231406/romantic-novels-500x500.jpg",
                      //   height: 200,
                      //   width: MediaQuery.of(context).size.width,
                      //   fit: BoxFit.scaleDown,
                      // );
                      return Image.file(
                        imgFile,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.scaleDown,
                      );
                    }
                  }(),
                  onTap: () {
                    print(imgFile);
                    showOptionsDialog(context);
                    print("Image change..");
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey),
                    )),
                SizedBox(height: 10),
                TextFormField(
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      hintText: 'Author',
                      hintStyle: TextStyle(color: Colors.grey),
                    )),
                SizedBox(height: 10),
                TextFormField(
                  minLines: 3,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Your review',
                    hintStyle: TextStyle(color: Colors.grey),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    // ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    // ),
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Post',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        print("Submit Post");
                        // showOptionsDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
