import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/button_styled.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcomeId = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.purple[100],
      end: Colors.purple[400],
    ).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/LogoImage.png'),
                      height: 100.0,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['CHAT DROP'],
                  textStyle: TextStyle(
                    color: Colors.purple[50],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonStyled(
              colour: Colors.pink[400],
              buttonTitle: 'Log In',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.loginId);
              },
            ),
            ButtonStyled(
              colour: Colors.blue[400],
              buttonTitle: 'Register',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.registerId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
