import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/produit.dart';

class Affichage extends StatefulWidget {
  const Affichage({ Key? key }) : super(key: key);

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  
  late Future<List> _produitList;

  String? idProduit;
  @override 
  void initState() {
    super.initState();
    _produitList = Produit.getAllProduits();
  }
  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      Object? arg = ModalRoute.of(context)!.settings.arguments;
      var newLivre= jsonDecode(arg.toString());
       setState(() {
         _produitList = _produitList.then<List>((value) {return [newLivre, ...value];});
      });
    }
     return Scaffold(
      appBar: AppBar(
        title: const Text("liste des produits"),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: _produitList,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i){
                  return Card(
                    child: ListTile(
                      title: Text( "nom : " + snapshot.data![i]['nom_produit'], style: const TextStyle(fontSize: 30),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text( "marque : " + snapshot.data![i]['marque_produit'], style: const TextStyle
                            (fontSize: 20)),
                          Text( "poids : " + snapshot.data![i]['poids_produit'], style: const TextStyle
                            (fontSize: 20)),
                          Text( "taille : " + snapshot.data![i]['taille_produit'], style: const TextStyle
                            (fontSize: 20)),
                          Text( "quantite : " + snapshot.data![i]['quantite_produit'], style: const TextStyle
                            (fontSize: 20)),
                          Text( "prix : " + snapshot.data![i]['prix_produit'], style: const TextStyle
                            (fontSize: 20)),
                          FloatingActionButton(
                            onPressed: () {
                              idProduit = snapshot.data![i]['id_produit'].toString();
                              Produit.supprimer(context, idProduit);
                            },
                            child: const Text("supprimer"),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/modifier',
                                arguments: snapshot.data![i]['id_produit'],
                              );
                            },
                            child: const Text("modifier"),
                          ),
                        ]),
                    ),
                  );
                }
                );
            }
            else{
              return const Center(
                child: Text("Pas de données"),
              );
            }
          },
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/ajout');
          },
          child: const Text("+"),
      ),  
    );
  }
}