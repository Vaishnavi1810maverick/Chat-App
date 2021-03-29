import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/button_styled.dart';
import 'welcome_screen.dart';
import 'developers_screen.dart';

class IntroductionPage extends StatefulWidget {
  static const String introductionId = "introduction_screen";
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                child: Image.asset(
                  "images/IntroPage.gif",
                  height: 350.0,
                  width: 350.0,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ColorizeAnimatedTextKit(
                    textAlign: TextAlign.center,
                    text: [
                      "Welcome To Chat Drop",
                      "Chat room for fun filled chats."
                    ],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    colors: [
                      Colors.purple[800],
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                      Colors.white
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonStyled(
              colour: Colors.purple[800],
              buttonTitle: 'Start Chatting',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, WelcomeScreen.welcomeId);
              },
            ),
            ButtonStyled(
              colour: Colors.purple[800],
              buttonTitle: 'Developers',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, DeveloperScreen.developerId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
