import 'dart:convert';

import 'package:breview/components/RouteAnimation.dart';
import 'package:breview/models/review.dart';
import 'package:breview/screens/home/create_review.dart';
import 'package:breview/widgets/reviewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key key}) : super(key: key);

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  List<Review> reviews = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Future<List<Review>> loadData() async {
  loadData() async {
    final jsonData =
        await rootBundle.loadString("assets/files/reviewData.json");
    final list = json.decode(jsonData) as List<dynamic>;
    reviews = list.map((e) => Review.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              'Abin',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                // color: FlutterFlowTheme.primaryColor,
                                color: Colors.amber[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Latest picks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                minLines: 3,
                style: TextStyle(color: Colors.white),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onTap: () {
                  print("On tap post...");
                  Navigator.of(context).push(FadeRoute(page: CreateReview()));
                },
                decoration: InputDecoration(
                  hintText: 'Add your story on your reads...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber[700]),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber[700]),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) =>
                      ReviewItem(review: reviews[index]))
            ],
          )),
        ),
      ),
    );
  }
}
