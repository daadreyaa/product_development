import 'package:flutter/material.dart';
import 'package:product_development/screens/achievements_page.dart';
import 'package:product_development/screens/certifications_page.dart';
import 'package:product_development/screens/events_page.dart';
import 'package:product_development/screens/forgot_password.dart';
import 'package:product_development/screens/home_page.dart';
import 'package:product_development/screens/login_page.dart';
import 'package:product_development/screens/profile_page.dart';
import 'package:product_development/screens/signup_page.dart';
import 'package:product_development/screens/skill_set_page.dart';
import 'package:product_development/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:product_development/screens/update_user_roles.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//add profile picture
// phone number authentication
// dark and light modes

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // home: SignUpPage(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        SignUpPage.id: (context) => SignUpPage(),
        ForgotPassword.id: (context) => ForgotPassword(),
        UpdateUserRoles.id: (context) => UpdateUserRoles(),
        EditProfile.id: (context) => EditProfile(),
        ChatScreen.id: (context) => ChatScreen(),
        AchievementsPage.id: (context) => AchievementsPage(),
        CertificationsPage.id: (context) => CertificationsPage(),
        SkillSetPage.id: (context) => SkillSetPage(),
        EventsPage.id: (context) => EventsPage(),
      },
    );
  }
}
