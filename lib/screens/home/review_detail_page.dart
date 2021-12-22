import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/models/review.dart';
import 'package:breview/screens/home/comment_page.dart';
import 'package:breview/utils/crud.dart';
import 'package:breview/widgets/commentItem.dart';
import 'package:breview/widgets/reviewItem.dart';
import "package:flutter/material.dart";

class ReviewDetailPage extends StatefulWidget {
  // const ReviewDetailPage({Key key}) : super(key: key);

  final Review review;
  const ReviewDetailPage({this.review});

  @override
  State<ReviewDetailPage> createState() => _ReviewDetailPageState();
}

class _ReviewDetailPageState extends State<ReviewDetailPage> {
  CrudMethods crud = new CrudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Image.network(
                            widget.review.bookImage,
                            height: 300,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.review.bookTitle,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            widget.review.author,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(height: 1, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.review.review,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 250,
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                        future: crud.getCommets(),
                        builder: (context, AsyncSnapshot<dynamic> snap) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder(
                                  stream: snap.data,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (context, index) {
                                            Review r = Review.fromJson(
                                                snapshot.data.docs[index]
                                                    .data(),
                                                snapshot.data.docs[index].id);
                                            return CommentItem();
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
                TextFormField(
                  onTap: () {
                    print("Prseed Comment");
                    Navigator.of(context).push(FadeRoute(page: CommentPage()));
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Comments...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[200]),
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[200]),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ));
  }
}
