import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const String loginId = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[500],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 230.0,
                  child: Image.asset('images/LogoImage.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: kTextDecorationField.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kTextDecorationField.copyWith(
                hintText: 'Enter your Password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.purple[900],
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    //Implement login functionality.
                    try {
                      final signInUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (signInUser != null) {
                        Navigator.pushNamed(context, ChatScreen.chatId);
                      }
                    } on PlatformException catch (error) {
                      showToast(error.message,
                          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    } catch (e) {
                      showToast(e.toString(),
                          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
