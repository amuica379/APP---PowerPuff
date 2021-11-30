import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class Storage{

  //Diretório
  Future<String> get localPath async{
    final directory= await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //Arquivo
  Future<File> get localFile async{
    final path= await localPath;
    return File('$path/db.txt');
  }

  //Read
  Future<String> readContent() async{
    try{
      final file = await localFile;
      String contents= await file.readAsString();
      return contents;
    } catch(e){
       return e.toString();
    }
  }

  //Write
  Future<File> writeContent(String contents) async{
    final file= await localFile;
    return file.writeAsString('$contents');
  }

}