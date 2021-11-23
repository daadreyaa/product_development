import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserRoles extends StatefulWidget {
  const UpdateUserRoles({Key? key}) : super(key: key);

  static const String id = 'update_roles';

  @override
  _UpdateUserRolesState createState() => _UpdateUserRolesState();
}

class _UpdateUserRolesState extends State<UpdateUserRoles> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  final String emailId = FirebaseAuth.instance.currentUser!.email.toString();
  // var x = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
  //   value.data()!['role'];
  // });

  var items = ['User', 'Admin'];

  // late String role;

  bool flag = false;

  // String role = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
  //    return value.data['role'].toString();
  // }) as String;

  // Future<String?> getRole() async {
  //   DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
  //   String? role;
  //   await documentReference.get().then((snapshot) {
  //     role = snapshot.data['role'].toString();
  //   });
  //   return role;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            } else {
              final list = snapshot.data!.docs;

              for (var i = 0; i < list.length; i++) {
                if (list[i]["email"] == emailId && list[i]["role"] == 'Admin') {
                  print(list[i]["email"]);
                  print(list[i]['role']);
                  flag = true;
                  break;
                }
              }

              // User Part
              // Unauthorized Page
              if (!flag) {
                print(FirebaseAuth.instance.currentUser!.uid);
                // print("role: $role");
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.dangerous,
                          color: Colors.black,
                          size: 100.0,
                        ),
                        Text(
                          "You are not authorized",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Else Part
              // This is for Admins

              else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index]["name"]),
                      subtitle: Text(list[index]["role"]),
                      trailing: DropdownButton(
                        value: list[index]["role"],
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            list[index].reference.update({
                              "role": newValue.toString(),
                            });
                          });
                        },
                      ),
                    );
                  },
                  itemCount: list.length,
                );
              }
            }
          },
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: UserList(),
      // ),
    );
  }
}
