import 'dart:io';
import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/models/book.dart';
import 'package:breview/models/review.dart';
import 'package:breview/screens/home/home_tab.dart';
import 'package:breview/utils/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class CreateReview extends StatefulWidget {
  // const CreateReview({Key key}) : super(key: key);
  final bool isFromBook;
  final Book book;
  const CreateReview(this.isFromBook, this.book);

  @override
  _CreateReviewState createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  File imgFile;
  final imgPicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String title;
  String author;
  String review;
  String imgURL;

  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

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

    String fileName = path.basename(imgFile.path);
    print(fileName);

    try {
      TaskSnapshot snapshot =
          await storage.ref().child("reviews/$fileName").putFile(imgFile);

      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        print(downloadUrl);
        setState(() {
          imgURL = downloadUrl;
        });
      } else {
        print('Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }
    } on FirebaseException catch (error) {
      print(error);
    }

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
                    child: Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Capture Image From Camera"),
                    onTap: () {
                      openCamera();
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
    if (widget.isFromBook) {
      title = widget.book.bookTitle;
      author = widget.book.author;
      imgURL = widget.book.bookImage;
    }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    child: () {
                      if (widget.isFromBook) {
                        return Image.network(
                          widget.book.bookImage,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.scaleDown,
                        );
                      } else {
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
                      }
                    }(),
                    onTap: () {
                      if (widget.isFromBook) {
                        return;
                      }
                      print(imgFile);
                      showOptionsDialog(context);
                      print("Image change..");
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      enabled: widget.isFromBook ? false : true,
                      initialValue: title,
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(height: 10),
                  TextFormField(
                      cursorColor: Colors.amber,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the author';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          author = value;
                        });
                      },
                      enabled: widget.isFromBook ? false : true,
                      initialValue: author,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Author',
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(height: 10),
                  TextFormField(
                    minLines: 4,
                    style: TextStyle(color: Colors.white),
                    maxLines: 7,
                    onChanged: (value) {
                      setState(() {
                        review = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please put your views';
                      }
                      return null;
                    },
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
                          if (_formKey.currentState.validate()) {
                            saveReview();
                          }
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
      ),
    );
  }

  saveReview() {
    print("Submit Post");
    // print();
    Review review = Review(
        bookTitle: title,
        author: author,
        bookImage: imgURL,
        review: this.review,
        reviewerId: "SdZlYdSyYQgPAbNHM8DdNWSJH5C2",
        reviewerProfileName: "ak672676",
        reviewerProfileImage:
            "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
        comments: [],
        id: null,
        likes: [],
        createdAt: DateTime.now().toUtc().millisecondsSinceEpoch.toString());

    CrudMethods.createReview(review);

    Navigator.of(context).push(FadeRoute(page: HomeTab()));
    // print(imgURL);
    // db.collection("reviews").add({
    //   "bookTitle": title,
    //   "bookAuthor": author,
    //   "review": review,
    //   "imgURL": imgURL,
    //   "reviewDatetime": DateTime.now().millisecondsSinceEpoch.toString(),
    // }).then((value) {
    //   print(value.id);
    //   Navigator.of(context).pop();
    // });
  }
}
