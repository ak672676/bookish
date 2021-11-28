import 'dart:convert';

import 'package:breview/models/review.dart';
import 'package:breview/widgets/reviewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
    print(reviews);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                      child: Row(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reviews.length,
                itemBuilder: (context, index) =>
                    ReviewItem(review: reviews[index]))
          ],
        )),
      ),
    );
  }
}
