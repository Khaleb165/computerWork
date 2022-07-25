// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    print(data);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
   // print(dateTime);
    //print(offset);

    //create a dateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset) ));
    print(now);
  }

  int counter = 0;
  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
