// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:myapp2/signup.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin
{
  bool hide = true;
  final _formKey = GlobalKey<FormState>();
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState(){
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 5),vsync: this);

    animation = Tween<double>(begin: 0, end: 2 * math.pi,
    ).animate(AnimationController(vsync:this)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    }));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("MY APP"),
        elevation: 10.0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 40, 80, 0),
                    child: Transform.rotate(
                      angle: animation.value,
                    child:Container(
                      child: Image.asset('assets/c4.gif',
                      scale: 2,
                      )
                    ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.36),
                  width: double.infinity,
                  height: 500,
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

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Username'
                              ),
                            ),
                            SizedBox(height: 20.0,),

                            TextField(
                              obscureText: hide,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                    icon: hide? Icon(Icons.visibility_off):
                                    Icon(Icons.visibility),
                                  )
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: (){},
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
                                    padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10)
                                ),
                                onPressed: (){},
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account yet?" ,
                                  style: TextStyle(fontSize: 18),

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
                          ],
                        ),
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
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
}


