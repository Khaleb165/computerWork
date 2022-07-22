// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData(){

    //simulate network request for a username


  }

  int counter = 0;
  @override
  void initState() {
    super.initState();
    print('initState function run');
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        } ,
        child: Text('Counter is $counter'),
      ),
    );
  }
}
