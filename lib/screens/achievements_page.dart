import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  static const String id = 'achievements_page';

  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C9AFA), Color(0xFFFFFF5F)],
            stops: [0, 0.8],
            begin: AlignmentDirectional(0.64, -1),
            end: AlignmentDirectional(-0.64, 1),
          ),
        ),
        child: Text(''),
      ),
    );
  }
}
