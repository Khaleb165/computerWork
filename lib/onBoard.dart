import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myapp2/login.dart';


class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: 'Welcome to MyApp',
              body: 'This is an app created for people to either post or accept job offers and work on them.',
              image: buildImage('assets/welcome.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Sign in/Sign up',
              body: 'Sign up with your email and password to join this vast community of users all over the world.',
              image: buildImage('assets/signIn.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title:'Post or accept a job' ,
              body: 'You can post a job for others to accept and negotiate a fee. Happy browsing!',
              image: buildImage('assets/job.png'),
              decoration: getPageDecoration(),
            )
          ],
          done: Text('Done',
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent
          ),),
          onDone: (){
            Navigator.of(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          showSkipButton: true,
          skip: Text('Skip',
          style: TextStyle(color: Colors.deepPurpleAccent),),
          next: Text('Next',
            style: TextStyle(color: Colors.deepPurpleAccent),),
          dotsDecorator: getDotDecorator(),
          onChange: (index) => print('Page $index selected'),
          onSkip: (){
            Navigator.of(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          skipOrBackFlex: 0,
          nextFlex: 0,
        )
    );
    }

  Widget buildImage(String path){
    return Center(child: Image.asset(path,width: 350,),);
  }

  DotsDecorator getDotDecorator() {
    return DotsDecorator(
      activeColor: Colors.deepPurpleAccent,
      activeSize: Size(22,10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      )
    );
  }

  PageDecoration getPageDecoration(){
    return PageDecoration(titleTextStyle: TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold
    ),
      bodyTextStyle: TextStyle(fontSize: 18,
      fontStyle: FontStyle.italic),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.all(20).copyWith(bottom: 0),
      bodyPadding: EdgeInsets.all(20).copyWith(bottom: 0),
      pageColor: Colors.white
    );
  }
}
