import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './home_screen.dart' as first;
import 'package:flutter/services.dart';
import './classes.dart';
import './analytics_screen.dart' as second;
import './history_screen.dart' as third;
import './notes_screen.dart' as fourth;
import './settings_screen.dart';
import './sales_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './login_screen.dart';



class Tabs extends StatefulWidget{

  final bool saveLogin;
  const Tabs({Key key, @required this.saveLogin}) : super(key: key);



  @override
  TabsState createState() => TabsState();

}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin, WidgetsBindingObserver{
  
  TabController controller;
  
  @override
  void initState(){
    super.initState();
    controller= TabController(vsync: this, length: 4);
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose(){
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
        if(widget.saveLogin == false){
          FirebaseAuth.instance.signOut();
        }
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        if(widget.saveLogin == false){
          FirebaseAuth.instance.signOut();
        }
        break;
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 235, 235, 235),
    ));
    return Scaffold(
        //body: HomeScreen(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(  
           backgroundColor: Color.fromARGB(255, 245, 245, 245),
            actions: <Widget>[
                IconButton(
                icon: Icon(Icons.settings),
                color:Color.fromARGB(255, 46, 46, 46),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context){
                        return SettingsScreen();
                      }
                    )
                  );
                }
              )
             ],

            title: Text(
              "POWERPUFF",
             style: TextStyle(
               fontFamily: 'Powerpuff',
               color: Color.fromARGB(255, 46, 46, 46),
               fontSize: 23.0,
               letterSpacing: -0.3,
               fontStyle: FontStyle.italic
             )
           ),
           elevation: 2.5,
           brightness: Brightness.light,
         )
        ),
        bottomNavigationBar: Material(
         elevation: 6.0,
         color:Color.fromARGB(255, 245, 245, 245),
         child: TabBar(
           controller: controller,
           indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(
                width: 2.5,
                color: Color.fromARGB(255, 46, 46, 46),
              ),
              insets: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 45.0)
           ),
           tabs: <Tab>[
             Tab(
               icon: Icon(
                 Icons.home,
                 color:Color.fromARGB(255, 46, 46, 46),
                ),              
              ),
             Tab(
               icon: Icon(
                 Icons.insert_chart,
                 color:Color.fromARGB(255, 46, 46, 46)
                )
             ),

             Tab(
               icon: Icon(
                 Icons.history,
                 color:Color.fromARGB(255, 46, 46, 46)
               )
             ),

             Tab(
               icon: Icon(
                 Icons.note_add,
                 color:Color.fromARGB(255, 46, 46, 46)
               )
             ),            
          ],
         ),
        ),
             floatingActionButtonLocation:  FloatingActionButtonLocation.centerDocked,
             floatingActionButton: RawMaterialButton(
               shape: const CircleBorder(),
               constraints: BoxConstraints(
                 minWidth: 50.0,
                 minHeight: 50.0
               ),
               child:Icon(
                      Icons.attach_money,
                      color: Colors.white
                      ),
               elevation: 0.0,
               fillColor: Color.fromARGB(255, 46, 46, 46),
               onPressed: (){
                 Navigator.push(
                   context, 
                   MaterialPageRoute(
                     builder: (context){
                       return TestFiller6();
                     }
                     )
                  );
                }
              ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[
              first.HomeScreen(),
              second.TestFiller2(),
              third.TestFiller3(),
              fourth.TestFiller4()
        ],
      )
       );

}


}

