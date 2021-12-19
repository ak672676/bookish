import 'package:breview/models/book.dart';
import "package:flutter/material.dart";

class BookDetailPage extends StatelessWidget {
  // const BookDetailPage({Key key}) : super(key: key);
  final Book book;
  const BookDetailPage({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Books'),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  book.bookImage,
                  height: 300,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 20),
              Text(
                book.bookTitle,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.amber),
              ),
              Text(
                book.author,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 20),
              // Add Category
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 20),
              Text(book.description,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
            ],
          ),
        ));
  }
}
