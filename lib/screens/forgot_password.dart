import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_development/screens/login_page.dart';
import 'package:product_development/components/rounded_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String id = 'forgot_password';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController textController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Fogot Password?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'No worries here you go',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                  ),
                ),
              ),
              RoundedButton(
                  title: 'Send Reset Link',
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = _auth.sendPasswordResetEmail(email: textController.text.trim());
                      Navigator.popAndPushNamed(context, LoginPage.id);
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
