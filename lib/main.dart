import 'package:flutter/material.dart';
import './app_screens/home_screen.dart' as first;
import 'package:flutter/services.dart';
import './app_screens/classes.dart';
import './app_screens/analytics_screen.dart' as second;
import './app_screens/history_screen.dart' as third;
import './app_screens/notes_screen.dart' as fourth;
import './app_screens/settings_screen.dart';
import './app_screens/sales_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './app_screens/login_screen.dart';
import './app_screens/passFile.dart';

//void main() => runApp(new AppTry1());


/////////////
void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        accentColor: Color.fromARGB(255, 150, 150, 150) 
        ),
      debugShowCheckedModeBanner: false,
      title: "Powerpuff Analytics",
      home: LoginScreen() //Tabs()
    )
  );
}

