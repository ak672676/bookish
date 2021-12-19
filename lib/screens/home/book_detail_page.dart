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
      body: Center(
        child: Text(
          book.author,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
