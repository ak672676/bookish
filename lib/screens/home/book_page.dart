import 'package:breview/models/book.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
              future: crud.getBooks(),
              builder: (context, AsyncSnapshot<dynamic> snap) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder(
                        stream: snap.data,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  Book b = Book.fromJson(
                                      snapshot.data.docs[index].data(),
                                      snapshot.data.docs[index].id);
                                  return BookItem(book: b);
                                });
                          } else {
                            return Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator());
                          }
                        }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
