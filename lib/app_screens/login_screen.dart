import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './landing_page.dart';
import 'dart:io';
import './passFile.dart';
import 'package:flutter/foundation.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }

}



class LoginScreenState extends State<LoginScreen>{
  bool _isLoading= false;
  String _email;
  String _password;
  String emailField= 'E-mail';
  String passwordField= 'Senha';
  String initialEmail= null;
  Color corBordaEmail= Colors.black;
  Color corBordaSenha= Colors.black;
  Color corEmail= Color.fromARGB(255, 46, 46, 46);
  Color corSenha= Color.fromARGB(255, 46, 46, 46);
  bool checkBoxValue= false;
  FirebaseUser firebaseUser;

  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
    void initState(){
      super.initState();
      getUser().then((firebaseUser){
        if(firebaseUser != null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return Tabs(saveLogin: true);
        }));
        }
      });
    }

  Future<FirebaseUser> getUser() async{
    return await FirebaseAuth.instance.currentUser();
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.white,
      child: _isLoading ? Center( // Tela de carregamento
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                     backgroundColor: Colors.black,
                     strokeWidth: 3.5,
                   ),
                  SizedBox(
                    height: 5.0, // SPACER
                  ),
                  Text(
                    'Carregando...',
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.w600
                    )
                  )
                ],
              )
          ):Container(
         padding:  const EdgeInsets.fromLTRB(
           20.0, 
           140.0,
           20.0,
           10.0),
         child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>[
           Form(
           key: _formKey,
            child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             SvgPicture.asset(
                'assets/powerpuff_name.svg',
                 color: Colors.black,
               ),
             SizedBox(
               height: 20.0, // SPACER
             ),
             TextFormField(
              initialValue: initialEmail,
              validator:(input){
                if(input.isEmpty || !input.contains('@') || !input.contains('.com') || input.contains(' ')){
                  return 'Por favor digite um e-mail válido.';
                }
                  return null; //TODO: TEST THIS
              },
              onSaved:(input){
                _email= input;
                },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corBordaEmail,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corBordaEmail,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                labelStyle: TextStyle(
                  color:corEmail,
                ),
                labelText: emailField
              ),
            ),
             SizedBox(
               height: 10.0, // SPACER
             ),
             TextFormField(
              cursorColor: Colors.black,
              validator:(input){
                if(input.length < 6){ //Senha de 06 caracteres
                  return 'Mínimo de 6 caracteres.';
                }
                return null; //TODO: TEST THIS
              },
              onSaved:(input){
                _password= input;
                },
              decoration: InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corBordaSenha,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: corBordaSenha,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                focusedErrorBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid
                  ),
                ),
                labelStyle: TextStyle(
                  color: corSenha,
                ),
                labelText: passwordField
                ),
              obscureText: true
            ),
            RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
              ),
              fillColor: Color.fromARGB(255, 25, 25, 25),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 12.0
                ),
              ),
              onPressed: (){
                signIn();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  checkColor: Colors.black,
                  value: checkBoxValue,
                  onChanged: (bool value){
                    setState(() {
                     checkBoxValue= value; 
                    });
                  },
                ),
                Text(
                 "Mantenha me logado",
                  style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ],
        )
      )
      ]
      )
    )      
  );
}


  Future<void> signIn() async{
    final formState= _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        setState(() {
          _isLoading= true; 
        });
        AuthResult user= await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: _email ,
           password: _password
        );

        if(checkBoxValue == true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
         return Tabs(saveLogin: true); //TODO: TEST PERSISTENCE
        }));
        }
        else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return Tabs(saveLogin: false);
        }));
        }
      }catch(error){
        var errorCode= error.code;
        var errorMessage= error.message;
        if(Platform.isAndroid){
          switch(errorMessage){
            case 'There is no user record corresponding to this identifier. The user may have been deleted.':
              print('Usuario nao existe');
              setState(() {
                _isLoading= false;
                emailField= 'Usuário não cadastrado';
                initialEmail= _email;
                corBordaEmail= Colors.red;
                corEmail= Colors.red;
                passwordField= 'Senha';
                corBordaSenha= Colors.black;
                corSenha= Color.fromARGB(255, 46, 46, 46);
              });
              break;
            case 'The password is invalid or the user does not have a password.':
              print('Senha incorreta');
              setState(() {
                _isLoading= false;
                passwordField= 'Senha incorreta';
                initialEmail= _email;
                corSenha= Colors.red;
                corBordaSenha= Colors.red;
                emailField= 'E-mail';
                corEmail= Color.fromARGB(255, 46, 46, 46);
                corBordaEmail= Colors.black;
              });
              break;
            case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
              print('Verifique a conexão com a internet');
              setState(() {
                _isLoading= false;

              });
              break;
          }
        }
        if(Platform.isIOS){
          switch(errorCode){
          case 'Error 17011':
            print('Usuario nao existe');
            setState(() {
              _isLoading= false;
              emailField= 'Usuário não cadastrado';
              passwordField= 'Senha';
            });
            break;
          case 'Error 17009':
            print('Senha incorreta');
            setState(() {
              _isLoading= false;
              passwordField= 'Senha incorreta';
              emailField= 'E-mail';
            });
            break;
          case 'Error 17020':
            print('Verifique a conexão com a internet');
            setState(() {
               _isLoading= false;
            });
            break;
          }
        }
      }
    }
  }
}
