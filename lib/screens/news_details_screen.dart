import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  final DocumentSnapshot news;
  const NewsDetailsScreen({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: ListView(
          children: [
            Text(
              widget.news['title'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                  height: 1.5),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.news['image']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.news['description'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                  height: 1.5),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
