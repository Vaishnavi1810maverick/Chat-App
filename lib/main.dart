import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/introduction_screen.dart';
import 'screens/developers_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        backgroundColor: Color(0xFFbc6ff1),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: IntroductionPage.introductionId,
      routes: {
        IntroductionPage.introductionId: (context) => IntroductionPage(),
        WelcomeScreen.welcomeId: (context) => WelcomeScreen(),
        DeveloperScreen.developerId: (context) => DeveloperScreen(),
        LoginScreen.loginId: (context) => LoginScreen(),
        RegistrationScreen.registerId: (context) => RegistrationScreen(),
        ChatScreen.chatId: (context) => ChatScreen()
      },
    );
  }
}
