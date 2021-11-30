import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './classes.dart';


class HomeScreenState extends State<HomeScreen>{
  int presses;
  int value; 
  int data;
  final db= Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
          child: IconButton(
             icon:Icon(Icons.publish),
             onPressed: (){
            //Criar nova remessa
            //Novo cliente
            //Novo Juice
            //Novo Sócio
            //Nova Venda
              db.collection('teste').document('teste1').updateData({
                'ButtonPresses': data+1
              });
             }
            )
          ),
        Center(
            child: StreamBuilder(
              stream:db.collection('teste').snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return const Text('Loading...');
                  data= snapshot.data.documents[0]['ButtonPresses'];
                return Text(
                    "Number of presses= $data"
                  );
              }
            )
          )    
     ]
    )
    );
  }

}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}




 /*       child: Text(
             "HOME",
              style: TextStyle(
                 fontSize: 50.0
              )
             )


class HomeScreen extends StatelessWidget{

  final db= Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: Center(
        child: IconButton(
          icon:Icon(Icons.publish),
          onPressed: (){
            //Criar nova remessa
            //Novo cliente
            //Novo Juice
            //Novo Sócio
            //Nova Venda
            var teste;
            teste = Juice(
              "Filhos Da Fruta",
              3, 30, 200, 35.00
            );
            db.collection('juices').add(teste);
            
          },
        )
      )
    );
  }

}*/