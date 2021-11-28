import 'dart:ui';

import "package:flutter/material.dart";

class ProfileSearchPage extends StatelessWidget {
  const ProfileSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () {},
          ),
          title: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Search',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.filter_list,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Divider(),
              ),
            );
          },
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // Map friend = friends[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
                  ),
                  radius: 25,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "ak672676",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "Books are my pass for",
                  style: TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.w400),
                ),
                trailing: ElevatedButton(
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber[600]),
                  ),
                  onPressed: () {},
                ),
                onTap: () {},
              ),
            );
          },
        ));
  }
}
