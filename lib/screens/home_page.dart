import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_development/components/rounded_button.dart';
import 'package:product_development/screens/achievements_page.dart';
import 'package:product_development/screens/profile_page.dart';
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
          backgroundColor: Colors.white,
          title: Text(
            'Welcome ' + user.displayName!,
            style: TextStyle(
              color: Colors.black,
            ),
          ),

          // centerTitle: true,
        ),
        body: Center(
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
                // SizedBox(
                //   height: 30,
                // ),
                // Text(
                //   'Welcome ' + user.displayName!,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 30.0,
                //     color: Colors.red,
                //   ),
                // ),
                // Text(
                //   'Considering this as Home Page',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 30.0,
                //   ),
                // ),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: ['Certifications', 'Skill Set', 'Achievements'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(context, ChatScreen.id),
                              child: Center(
                                child: Text(
                                  '$i',
                                  style: TextStyle(fontSize: 26.0),
                                ),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
                // RoundedButton(
                //   title: 'Update Roles',
                //   color: Colors.lightBlueAccent,
                //   onPressed: () => Navigator.pushNamed(context, UpdateUserRoles.id),
                // ),
                // RoundedButton(
                //   title: 'Logout',
                //   color: Colors.lightBlueAccent,
                //   onPressed: () {
                //     setState(() {
                //       showSpinner = true;
                //     });
                //     FirebaseAuth.instance.signOut();
                //     SystemNavigator.pop();
                //     setState(() {
                //       showSpinner = false;
                //     });
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
