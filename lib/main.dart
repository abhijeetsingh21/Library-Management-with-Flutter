// import 'package:ai_radio/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hridey/chatScreens/bbaChat_screen.dart';
import 'package:hridey/chatScreens/bcaChat_screen.dart';
import 'package:hridey/chatScreens/civilChat_screen.dart';
import 'package:hridey/chatScreens/cseChat_screen.dart';
import 'package:hridey/chatScreens/eceChat_screen.dart';
import 'package:hridey/chatScreens/mechanicalChat_screen.dart';
import 'package:hridey/course.dart';
import 'package:hridey/course_screen/bba.dart';
import 'package:hridey/course_screen/bca.dart';
import 'package:hridey/course_screen/civil.dart';
import 'package:hridey/course_screen/ece.dart';
import 'package:hridey/course_screen/mechanical.dart';
import './welcome_page.dart';
import 'course_screen/cse_screen.dart';
import './sign_upScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        SignUpScreen.id: (context) => const SignUpScreen(),
        SelectCourse.id: ((context) => const SelectCourse()),
        WelcomeScreen.id: ((context) => WelcomeScreen()),
        CseScreen.id: ((context) => CseScreen()),
        BbaScreen.id: (context) => BbaScreen(),
        BcaScreen.id: (context) => BcaScreen(),
        MechanicalScreen.id: (context) => MechanicalScreen(),
        CivilScreen.id: (context) => CivilScreen(),
        EceScreen.id: (context) => EceScreen(),
        CseChatScreen.id: ((context) => CseChatScreen()),
        BbaChatScreen.id: (context) => BbaChatScreen(),
        BcaChatScreen.id: (context) => BbaChatScreen(),
        CivilChatScreen.id: (context) => CivilChatScreen(),
        EceChatScreen.id: (context) => EceChatScreen(),
        MechanicalChatScreen.id: (context) => MechanicalChatScreen(),
      },
    );
  }
}
