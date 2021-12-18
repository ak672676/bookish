import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        children: [
          Image.network(
            "https://5.imimg.com/data5/WC/ML/MY-68231406/romantic-novels-500x500.jpg",
            height: 150,
            fit: BoxFit.scaleDown,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Romantic Novels",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
