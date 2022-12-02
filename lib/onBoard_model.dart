import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button
});
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
      img: 'assets/welcome.png',
      text: 'Welcome to myApp',
      desc: 'This is an app created for people to either post or accept job offers and work on them.',
      bg: Colors.white,
      button: Colors.deepPurpleAccent
  ),
  OnboardModel(
      img: 'assets/signIn.png',
      text: 'Sign in/Sign up',
      desc: 'Sign up with your email and password to join this vast community of users all over the world.',
      bg: Colors.deepPurpleAccent,
      button: Colors.white
  ),
  OnboardModel(
      img: 'assets/job.png',
      text: 'Post or accept a job',
      desc: 'You can post a job for others to accept and negotiate a fee. Happy browsing!',
      bg: Colors.white,
      button: Colors.deepPurpleAccent
  ),
];