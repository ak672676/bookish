import 'package:breview/services/auth.dart';
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                CircleAvatar(
                  backgroundImage: Image.network(
                          "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg")
                      .image,
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "ak672676",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Books📙 were my pass to personal freedom🧡",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: Row(children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        Text(
                          "Follow",
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber[800]),
                      ),
                      onPressed: () {},
                    ),
                    (() {
                      if (true) return SizedBox(width: 10);
                      return Container(
                          width: 0, height: 0); // Check for condition
                    }()),
                    ElevatedButton(
                      child: Row(children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber[800]),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "12",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Reviews",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "654",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white54,
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(5),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 200 / 200,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image.network(
                        "https://5.imimg.com/data5/WC/ML/MY-68231406/romantic-novels-500x500.jpg",
                        fit: BoxFit.scaleDown,
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.amber[800],
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.amber[800]),
                        )
                      ]),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  onPressed: () {
                    AuthService().signOut();
                    print("Logout");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
