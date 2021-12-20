import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/models/book.dart';
import 'package:breview/screens/home/book_detail_page.dart';
import 'package:breview/screens/home/create_review.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  // const BookItem({Key key}) : super(key: key);
  final Book book;
  const BookItem({this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ilhuhui");
        Navigator.of(context)
            .push(SlideRightRoute(page: BookDetailPage(book: book)));
      },
      child: Container(
        height: 160,
        child: Row(
          children: [
            Image.network(
              book.bookImage,
              height: 150,
              fit: BoxFit.scaleDown,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.bookTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        book.author,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.amber,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(FadeRoute(page: CreateReview(true, book)));
                      },
                      child: Text("Give your review")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
