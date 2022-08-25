
// ignore_for_file: prefer_const_constructors, unused_import

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
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('MY APP'),
        elevation: 10.0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(80,35,40,0),
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
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.28),
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
                        decoration: InputDecoration(
                            hintText: 'E-mail'
                        ),

                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Username'
                        ),

                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        controller: password,
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
                            )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextField(
                        controller: confirmPassword,
                        obscureText: hide,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hide= !hide;
                                });
                              },
                              icon:hide? Icon(Icons.visibility_off):
                              Icon(Icons.visibility),
                            )
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Center(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
                          ),
                          onPressed: (){
                            if(password.text != confirmPassword.text){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text('Messages'),
                                  content: Text('Passwords do not match'),
                                );
                              }
                              );}
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
