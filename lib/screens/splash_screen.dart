import 'package:blog_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/blog-app-608e8.appspot.com/o/news%2Flogo.png?alt=media&token=2e4bfebc-c5a4-4116-b9c8-191ce1cc684d",
          width: 200.0,
        ),
      ),
    );
  }
}
