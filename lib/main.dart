import 'package:destini/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xffefe5dc),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/HomePage.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: StoryApp(),
              ),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {'/homePage': (context) => HomePage()},
      ),
    );

class StoryApp extends StatefulWidget {
  @override
  _StoryAppState createState() => _StoryAppState();
}

class _StoryAppState extends State<StoryApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Let's go on an Adventure \n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Painter',
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
            },
            color: Color(0xff02c39a),
            textColor: Color(0xffd8e2dc),
            child: Text(
              "Take me to the Magic World!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dosis',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
