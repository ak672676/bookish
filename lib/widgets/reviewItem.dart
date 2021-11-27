import 'package:badges/badges.dart';
import "package:flutter/material.dart";

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: Image.network(
                          "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg")
                      .image,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "ak672676",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "27 mins ago",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                ),
              ),
              Image.network(
                "https://5.imimg.com/data5/WC/ML/MY-68231406/romantic-novels-500x500.jpg",
                height: 270,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text("The One Indian Girl",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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
                  "Thus h oihdowihd oooiwhdoh oi oh whodh owiqhd o oih oqwdh ohoiwhdoi wdo ooihwoid o ho ohoig ui diugd iugwiugd ig iugiugwidg ig wdig iugw iug iqwdug igigiwugd iuwgd iuwgdigwd "),
              SizedBox(
                height: 2.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.thumb_up_alt_rounded,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "Comments...",
                ),
              ),
            ],
          )),
    );
  }
}
