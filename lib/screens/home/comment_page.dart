import "package:flutter/material.dart";

class CommentPage extends StatelessWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Comment'),
      ),
      body: Center(
        child: Text(
          'Comment',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
