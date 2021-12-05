import 'package:breview/services/crud.dart';
// import 'package:breview/util/Constants.dart';
import 'package:breview/widgets/BlogsWidget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendProfile extends StatefulWidget {
  FriendProfile({Key key}) : super(key: key);

  @override
  _FriendProfileState createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Stream blogsStream;
  CrudMethods crudMethods = new CrudMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crudMethods.getData().then((result){
      blogsStream = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFFB39738),
        elevation: 8,
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x3A000000),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://i.picsum.photos/id/1074/5472/3648.jpg?hmac=w-Fbv9bl0KpEUgZugbsiGk3Y2-LGAuiLZOYsRk0zo4A',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Text(
                            'Rajat Ranjan',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'See my favorite picks.',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  blogsStream != null ?
                  StreamBuilder(
                      stream: blogsStream,
                      builder: (context, snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index){
                              return BlogsWidget(
                                  image: snapshot.data.documents[0].data['image'],
                                  likes: snapshot.data.documents[0].data['likes'].toString()
                              );
                            });
                      })
                  // BlogsWidget(
                  //     image: this.blogSnapshot.documents[0].data['image'],
                  //     likes: this.blogSnapshot.documents[0].data['likes'].toString()
                  // )
                      :Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.94,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6,
                                    color: Color(0x3A000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  blogsStream != null ?
                  StreamBuilder(
                      stream: blogsStream,
                      builder: (context, snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index){
                              return BlogsWidget(
                                  image: snapshot.data.documents[0].data['image'],
                                  likes: snapshot.data.documents[0].data['likes'].toString()
                              );
                            });
                      })
                  // BlogsWidget(
                  //     image: this.blogSnapshot.documents[0].data['image'],
                  //     likes: this.blogSnapshot.documents[0].data['likes'].toString()
                  //   )
                      :Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}