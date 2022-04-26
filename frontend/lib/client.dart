import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Client {

  static Future<List> getAllClients() async{
    try{
      var res = await http.get(Uri.parse('http://127.0.0.1:8000/api/listeclients'));
      print(res);
      if(res.statusCode == 200){
        return jsonDecode(res.body);
      }
      else{
        return Future.error("erreur serveur");
      }
    }
    catch(err){
      return Future.error(err);
    }
  }

  static Login(BuildContext context, login, password) async{
    try{
      var connection = {"email": login, "password": password};
      var res = await http.post(
        // pour la connexion
          Uri.parse("http://127.0.0.1:8000/api/listeclients"),
          body: connection
      );
      if(res.statusCode != 200){
        Navigator.pushNamed(context, '/liste');
      }
      else{
        Navigator.pushNamed(context, '/');
      }
    }
    catch(err){
      return Future.error(err);
    }
  }
  static ajout(BuildContext context, title, body) async{
    try{

      Map<String,dynamic> data= {"title":title,"body":body};
      var res = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/listeclients'),
          body: data
      );
      if(res.statusCode == 201){
        Navigator.pushNamed(context, '/liste', arguments: res.body

        );
      }
      else{
        Navigator.pushNamed(context, '/');
      }
    }
    catch(err){
      return Future.error(err);
    }
  }
}