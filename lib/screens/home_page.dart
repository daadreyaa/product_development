import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_development/components/rounded_button.dart';
import 'package:product_development/screens/achievements_page.dart';
import 'package:product_development/screens/certifications_page.dart';
import 'package:product_development/screens/events_page.dart';
import 'package:product_development/screens/profile_page.dart';
import 'package:product_development/screens/skill_set_page.dart';
import 'package:product_development/screens/update_user_roles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'chat_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSpinner = false;

  User user = FirebaseAuth.instance.currentUser!;
  String url = FirebaseAuth.instance.currentUser!.photoURL == null ? '' : FirebaseAuth.instance.currentUser!.photoURL!;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.logout, color: Colors.red),
          ),
          // automaticallyImplyLeading: false,
          elevation: 0,
          // backgroundColor: Colors.white,
          title: Text(
            'Welcome ' + user.displayName!,
            style: TextStyle(
              color: Colors.black,
            ),
          ),

          // centerTitle: true,
        ),
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EditProfile.id);
                    },
                    child: url != ''
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(url),
                            radius: 75.0,
                          )
                        : CircleAvatar(
                            child: Icon(
                              Icons.image,
                              size: 38.0,
                            ),
                            radius: 75.0,
                          ),
                  ),
                  TileForModule(title: 'Events!!', navigation: EventsPage.id),
                  TileForModule(title: 'Just 4M', navigation: ChatScreen.id),
                  TileForModule(title: 'Certifications', navigation: CertificationsPage.id),
                  TileForModule(title: 'Skill Set', navigation: SkillSetPage.id),
                  TileForModule(title: 'Achievements', navigation: AchievementsPage.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TileForModule extends StatelessWidget {
  const TileForModule({required this.title, required this.navigation});

  final String title;
  final String navigation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 28.0),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, navigation),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
