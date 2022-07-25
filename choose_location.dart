// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, unused_local_variable, unused_import

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


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

    );
  }
}
