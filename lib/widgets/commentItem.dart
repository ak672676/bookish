import "package:flutter/material.dart";

class CommentItem extends StatelessWidget {
  const CommentItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.grey[100],
      ),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: Image.network(
                      "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg")
                  .image,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "ak672676",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "kug iugduig iug iwqhd oqiwhd oiqwhdoiqwhd oiwqhdoiqhw doiqwhdoiq wodihqw oidhqoidhoiqdh oiqh doihq owdiqh oieuif ggef ui",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )
      ]),
    );
  }
}
