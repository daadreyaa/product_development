import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_development/screens/login_page.dart';
import 'package:product_development/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String id = 'signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController textController1, textController2, textController3;
  late bool passwordVisibility;
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    passwordVisibility = false;
  }

  Future<void> addUser(String username, String email) async {
    // _auth.currentUser!.updatePhotoURL('fsadfsf');
    // _auth.currentUser!.metadata;
    users
        .doc(_auth.currentUser!.uid)
        .set(
          {
            'name': username,
            'email': email,
            'role': 'User',
          },
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    _auth.currentUser!.updateDisplayName(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.person,
                        // color: Color(0xFFBCBCBC),
                        color: Colors.white,
                        size: 100,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'SIGN UP',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF303030),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'NAME',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF378DFF),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 5),
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Name',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF303030),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'EMAIL',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF378DFF),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 5),
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Email Address',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF303030),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter Email Address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                              child: Text(
                                'PASSWORD',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF378DFF),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 5),
                              child: TextFormField(
                                controller: textController3,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF303030),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF565656),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility = !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                              child: RoundedButton(
                                title: 'Sign Up',
                                color: Color(0xFF3474E0),
                                onPressed: () async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try {
                                    String name = textController1.text.trim();
                                    String email = textController2.text.trim();
                                    String password = textController3.text;
                                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                    addUser(name, email);
                                    print(newUser);

                                    Navigator.popAndPushNamed(context, LoginPage.id);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print('The password provided is too weak.');
                                    } else if (e.code == 'email-already-in-use') {
                                      print('The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                    child: Text(
                                      'Have an Account?',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF303030),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.popAndPushNamed(context, LoginPage.id),
                                    child: Text(
                                      'Log In',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          color: Color(0xFFFF5600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
