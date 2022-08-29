import 'dart:ui';

import 'package:blog_app/screens/news_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('news').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Blog Site'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            padding: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(news: document),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 250.0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 12.0, right: 12.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    data['title'],
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    data['title'],
                                    maxLines: 2,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
