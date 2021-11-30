import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:powerpuff_0_1/app_screens/login_screen.dart';
import 'landing_page.dart';

class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Container(
       child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CONFIG.",
              style: TextStyle(
                fontSize: 50.0
              )
             ),
            IconButton(
              icon: Icon(Icons.backspace),
              onPressed: (){
                //TODO: Implement logout
                FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                    return LoginScreen();
                  }),(Route<dynamic> route)=>false);
              },
            )
          ],
        )     
      )
    ),
    );  
  }
}