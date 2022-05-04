import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produit {
  static Future<List> getAllProduits() async {
    try {
      var res = await http.get(Uri.parse('http://127.0.0.1:8000/api/listeproduit'));

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List> getProduit() async {
    try {
      var res = await http.get(Uri.parse('http://127.0.0.1:8000/api/produit'));

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Login(BuildContext context, login, password) async {
    try {
      //var connection = {"email": login, "password": password};
      final res = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/listeproduit"),
      );
      if (jsonDecode(res.body)["result"] == 'true' &&
          jsonDecode(res.body)["user"]["admin"] == 1) {
        //print(res);
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajout(BuildContext context, nom_produit, marque_produit, poids_produit, taille_produit, quantite_produit, prix_produit) async{

    try{
      Map<String,dynamic> data= {"nom_produit":nom_produit,"marque_produit":marque_produit,"poids_produit":poids_produit,"taille_produit":taille_produit,"quantite_produit":quantite_produit,"prix_produit":prix_produit};
      var res = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/ajoutProduit/$nom_produit/$marque_produit/$poids_produit/$taille_produit/$quantite_produit/$prix_produit'),
      );
      if(res.statusCode == 201){
        // Si ça ajoute pas
        Navigator.pushNamed(context, '/', arguments: res.body
        );
      }
      else{
        Navigator.pushNamed(context, '/liste');
      }

    }
    catch(err){
      return Future.error(err);
    }
  }

  static supprimer(BuildContext context, id) async {
    print('supprimer id : $id');
    try {
      var res = await http.get(Uri.parse(
          'http://127.0.0.1:8000/api/supprimerProduit/$id'));
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static modifier(BuildContext context, id) async {
    print('modifier id : $id');
    try {
      var res = await http.get(Uri.parse(
          'http://127.0.0.1:8000/api/supprimerProduit/$id'));
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}