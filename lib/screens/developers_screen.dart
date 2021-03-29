import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/button_styled.dart';
import 'welcome_screen.dart';

class DeveloperScreen extends StatefulWidget {
  static const String developerId = "developer_screen";
  @override
  _DeveloperScreenState createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "images/developers.gif",
                height: 200.0,
                width: 200.0,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: ColorizeAnimatedTextKit(
                    textAlign: TextAlign.center,
                    text: ["APP DEVELOPERS"],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.purple,
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
              height: 20.0,
              width: 250.0,
              child: Divider(
                color: Colors.purple[900],
              ),
            ),
            Text(
              'Shirisha Krishnan',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 20.0,
                  color: Colors.teal[900],
                ),
                title: Text(
                  'Shirishakrishnan12@gmail.com',
                  style: TextStyle(color: Colors.teal[900], fontSize: 20.0),
                ),
              ),
            ),
            Text(
              'Tharani B ',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 20.0,
                  color: Colors.teal[900],
                ),
                title: Text(
                  'Tharanibalu2000@gmail.com',
                  style: TextStyle(color: Colors.teal[900], fontSize: 20.0),
                ),
              ),
            ),
            Text(
              'Vaishnavi Seetharaman',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 20.0,
                  color: Colors.teal[900],
                ),
                title: Text(
                  'Vaishuseetha1810@gmail.com',
                  style: TextStyle(color: Colors.teal[900], fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonStyled(
              colour: Color(0xff892cdc),
              buttonTitle: 'Go to Welcome Screen',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, WelcomeScreen.welcomeId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
