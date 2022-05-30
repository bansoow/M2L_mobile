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

  static Login(BuildContext context, email, password) async {
    try {
      var connection = {"email": email, "password": password};
      final res = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/verifConnexion/$email/$password"),
      );
      print(" le truc c'est " + jsonDecode(res.body)["result"]);
      if (jsonDecode(res.body)["result"] == 'true' &&
          jsonDecode(res.body)["admin"] == 'true') {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}