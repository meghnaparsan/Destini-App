import 'package:destini/story_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StoryBrain storyBrain = new StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefe5dc),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/MainPage.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FlatButton(
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Quit?",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Bye.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () =>
                                  Navigator.popAndPushNamed(context, '/'),
                              width: 120,
                            )
                          ],
                        ).show();
                      },
                      color: Color(0xffaec5a8),
                      textColor: Color(0xff2f2f2f),
                      child: Text(
                        "I do not want to continue!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dosis',
                        ),
                      ),
                    ),
                  ),
                ),

                //Question:
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        storyBrain.getStory(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xff2f2f2f),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AmaticSC',
                        ),
                      ),
                    ),
                  ),
                ),

                //True Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FlatButton(
                      onPressed: () {
                        setState(
                          () {
                            storyBrain.nextStory(1);
                          },
                        );
                      },
                      color: Color(0xffccbfd0),
                      textColor: Color(0xff2f2f2f),
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dosis',
                        ),
                      ),
                    ),
                  ),
                ),

                //False Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: FlatButton(
                        onPressed: () {
                          setState(
                            () {
                              storyBrain.nextStory(2);
                            },
                          );
                        },
                        color: Color(0xffc9eac1),
                        textColor: Color(0xff2f2f2f),
                        child: Text(
                          storyBrain.getChoice2(),
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Dosis',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
