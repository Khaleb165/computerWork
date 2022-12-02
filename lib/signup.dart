
// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/login.dart';
import 'package:myapp2/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hide = true;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(80,100,40,0),
                  child: Text(
                    "CREATE Y0UR \n ACCOUNT",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only( topRight: Radius.elliptical(100.0,100.0),topLeft: Radius.elliptical(100.0,100.0))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 40.0
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      TextField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'E-mail',
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width:1,style: BorderStyle.none,color: Colors.grey)
                            )

                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Username',
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width:1,style: BorderStyle.none,color: Colors.grey)
                            )
                        ),

                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        controller: _passwordTextController,
                        obscureText: hide,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hide= !hide;
                                });
                              },
                              icon:hide? Icon(Icons.visibility_off):
                              Icon(Icons.visibility),
                            ),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width:1,style: BorderStyle.none,color: Colors.grey)
                            )
                        ),
                      ),

                      SizedBox(height: 15.0,),
                      Center(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: EdgeInsets.symmetric(horizontal: 65,vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                          ),
                          onPressed: (){
                            FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password:_passwordTextController.text ,).then((value) {
                                print('Account created');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            }).onError((error, stackTrace) {
                              print('Error ${error.toString()}');
                              showDialog(context: context, builder: (context) => AlertDialog(content: Text(error.toString()),));

                            });
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?" ,
                            style: TextStyle(fontSize: 18),

                          ),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                            child: Text("Log in",
                              style: TextStyle(fontSize: 15,
                              color: Colors.deepPurpleAccent
                              ),
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
