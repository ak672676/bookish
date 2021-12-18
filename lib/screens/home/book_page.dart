import 'package:breview/utils/crud.dart';
import 'package:breview/widgets/bookItem.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  CrudMethods crud = new CrudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Center(
        child: BookItem(),
      ),
    );
  }
}
