
// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp2/onBoard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isVisible = false;

  _HomeScreenState(){

    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OnBoardScreen()), (route) => false);
      });
    });

    Timer(
        const Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.deepPurpleAccent],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            child: Image.asset('assets/mylogo.png',
            scale: 20,),
          ),
        ),
      ),
    );
  }
}
