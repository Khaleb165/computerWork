// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/forgotPassword.dart';
import 'package:myapp2/loginPage.dart';
import 'package:myapp2/signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40,30,40,0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                              height: 20.0,
                              width: 360.0,
                            ),
                          ),
                          logoWidget('assets/mylogo.png'),
                        ],
                      ),
                    ),
                    ),
                  ),
                ]),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.18),
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 45
                        ),
                      ),
                      SizedBox(height: 30.0,),

                      Column(
                        children: [
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
                            controller: _passwordTextController,
                            obscureText: hide,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'enter your password',
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      hide = !hide;
                                    });
                                  },
                                  icon: hide? Icon(Icons.visibility_off):
                                  Icon(Icons.visibility),
                                  color: Colors.deepPurpleAccent,
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
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: (){
                                Navigator.of(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                              },
                              child: Text('Forgot password?',
                              style: TextStyle(
                                color: Colors.deepPurpleAccent
                              ),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  padding: EdgeInsets.symmetric(horizontal: 65,vertical: 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                              ),
                              onPressed: (){
                                FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: _emailTextController.text.trim(),
                                    password: _passwordTextController.text.trim()).then((value) {
                                      print('Signed in');
                                  Navigator.of(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPageMain()));
                                }).onError((error, stackTrace) {
                                  print('Error ${error.toString().trim()}');
                                  showDialog(context: context, builder: (context) => AlertDialog(content: Text(error.toString().trim()),));

                                });
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account yet?" ,
                                style: TextStyle(fontSize: 15),

                              ),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                              },
                                child: Text("Sign up",
                                  style: TextStyle(fontSize: 15,
                                  color: Colors.deepPurpleAccent
                                  ),

                                ),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.black,)),
                              SizedBox(width: 4,),
                              Text('Or sign in with',
                              style: TextStyle(
                                fontSize: 16
                              ),),
                              SizedBox(width: 4,),
                              Expanded(child: Divider(color: Colors.black,)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             // Padding(padding: EdgeInsets.all(16)),
                              IconButton(onPressed: (){},
                                  icon: Image.asset('assets/google.png'),
                                iconSize: 50,
                              ),
                              IconButton(onPressed: (){},
                                  icon: Image.asset('assets/Facebook.png',),
                                iconSize: 50,
                              ),
                              IconButton(onPressed: (){},
                                  icon: Image.asset('assets/github.png'),
                                iconSize: 50,
                              ),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
        ),
      );

  }

  Image logoWidget (String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 120,
      height: 120,
    );
  }
}


