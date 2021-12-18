import 'package:flutter/material.dart';

class SkillSetPage extends StatefulWidget {
  const SkillSetPage({Key? key}) : super(key: key);

  static const String id = 'skill_set_page';

  @override
  _SkillSetPageState createState() => _SkillSetPageState();
}

class _SkillSetPageState extends State<SkillSetPage> {
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
