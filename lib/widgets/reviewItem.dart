import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/models/review.dart';
import 'package:breview/screens/home/review_detail_page.dart';
import "package:flutter/material.dart";

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({Key key, this.review})
      : assert(review != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4,
      shadowColor: Colors.amber[400],
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      Image.network(review.reviewerProfileImage).image,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  review.reviewerProfileName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Text(
                  "27 mins ago",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("tapped");
                  Navigator.of(context).push(
                      SlideRightRoute(page: ReviewDetailPage(review: review)));
                },
                child: Column(
                  children: [
                    Image.network(
                      review.bookImage,
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(review.bookTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                    // Row(
                    //   children: [
                    //     Badge(
                    //       shape: BadgeShape.square,
                    //       badgeColor: Colors.deepPurple,
                    //       borderRadius: BorderRadius.circular(8),
                    //       badgeContent:
                    //           Text('BADGE', style: TextStyle(color: Colors.white)),
                    //     ),
                    //   ],
                    // )
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      review.review,
                      maxLines: 3,
                      style: TextStyle(color: Colors.white54, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("tapped like");
                    },
                    child: Icon(
                      Icons.thumb_up_alt_rounded,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    review.likes.length.toString(),
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Comments...",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
