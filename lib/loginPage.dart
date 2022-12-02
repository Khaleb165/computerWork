// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/login.dart';


class LoginPageMain extends StatelessWidget {
  const LoginPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        actions: [
          PopupMenuButton(
            enabled: true,
            itemBuilder: (context) => [
              PopupMenuItem(child: InkWell(
                  onTap: (){
                    FirebaseAuth.instance.signOut().then((value) {
                      print('Signed out');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  },
                  child:
              Text('Logout'))),
              PopupMenuItem(child: Text('About'))
            ],

          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text('Welcome'))
          ],
        ),
      ),
    );
  }
}
