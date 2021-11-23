import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_development/components/rounded_button.dart';
import 'package:product_development/screens/profile_page.dart';
import 'package:product_development/screens/update_user_roles.dart';

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
        body: Center(
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
                        radius: 50.0,
                      )
                    : CircleAvatar(
                        child: Icon(
                          Icons.image,
                          size: 38.0,
                        ),
                        radius: 50.0,
                      ),
              ),
              Text(
                'Welcome ' + user.displayName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.red,
                ),
              ),
              Text(
                'Considering this as Home Page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              RoundedButton(
                title: 'Update Roles',
                color: Colors.lightBlueAccent,
                onPressed: () => Navigator.pushNamed(context, UpdateUserRoles.id),
              ),
              RoundedButton(
                title: 'Logout',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  setState(() {
                    showSpinner = true;
                  });
                  FirebaseAuth.instance.signOut();
                  SystemNavigator.pop();
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
