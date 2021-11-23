import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart';
import 'package:product_development/components/rounded_button.dart';

class EditProfile extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // File file = File(FirebaseAuth.instance.currentUser!.photoURL!);
  File? file;
  final User _authUser = FirebaseAuth.instance.currentUser!;
  bool showSpinner = false;
  bool isVisible = false;

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: chooseImage,
                      child: file != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(file!),
                              radius: 100.0,
                            )
                          : _authUser.photoURL != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(_authUser.photoURL!),
                                  radius: 100.0,
                                )
                              : CircleAvatar(
                                  child: Icon(
                                    Icons.image,
                                    size: 48,
                                  ),
                                  radius: 100.0,
                                ),
                      // : CircleAvatar(
                      //     backgroundImage: FileImage(file!),
                      //     radius: 100.0,
                      //   ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextField(
                //   controller: _textEditingController,
                //   decoration: InputDecoration(labelText: "Name", hintText: "Enter name", border: OutlineInputBorder()),
                // ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  title: 'Update Profile',
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });
                    updateProfile(context);
                    setState(() {
                      isVisible = true;
                      showSpinner = false;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: isVisible,
                  child: Text(
                    'Profile Updated !!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    XFile xfile = await ImagePicker().pickImage(source: ImageSource.gallery) as XFile;
    print("file " + xfile.path);
    file = File(xfile.path);
    setState(() {});
  }

  updateProfile(BuildContext context) async {
    Map<String, dynamic> map = Map();
    if (file != null) {
      String url = await uploadImage();
      map['profileImage'] = url;
      _authUser.updatePhotoURL(url);
    }
    // map['name'] = _textEditingController.text;

    await FirebaseFirestore.instance.collection("users").doc(_authUser.uid).update(map);
    // Navigator.pop(context);
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance.ref().child("profile").child(FirebaseAuth.instance.currentUser!.uid + "_" + basename(file!.path)).putFile(file!);

    return taskSnapshot.ref.getDownloadURL();
  }
}
