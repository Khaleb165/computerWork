import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(40,150,40,0),
                child: Center(child: Icon(Icons.password,
                size: 100,
                color: Colors.white,)),
                ),

    Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
    width: double.infinity,
    height: 450,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( topRight: Radius.elliptical(100.0,100.0),topLeft: Radius.elliptical(100.0,100.0))
    ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 80)),
          Center(child: Text('Enter your Email here and we will send you a reset link',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic
          ),),),
          SizedBox(height: 30,),

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
          SizedBox(height: 20,),

          Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 65,vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
              ),
              onPressed: (){
                FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text).then((
                    value) {
                  print('Password reset link sent! Check your email');
                  showDialog(context: context, builder: (context) => AlertDialog(content:
                  Text('Password reset link sent! Check your email'),));

                }
                ).onError(
                        (error, stackTrace) {
                      print('Error ${error.toString()}');
                      showDialog(context: context, builder: (context) =>
                          AlertDialog(content: Text(error.toString()),));
                    });
              },
              child: Text('Reset password',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),),
            ),
          )
        ],
      ),
    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
