import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/produit.dart';

class Modifier extends StatefulWidget {
  const Modifier({ Key? key }) : super(key: key);

  @override
  State<Modifier> createState() => _AffichageState();
}

class _AffichageState extends State<Modifier> {

  late Future<List> _Produit;

  String? id;

  @override
  Future call_getProduit(context, id) async {
    print("test " + id);
    _Produit = Produit.getProduit(context, id);
  }

  @override
  Widget build(BuildContext context) {
    call_getProduit(context, ModalRoute.of(context)!.settings.arguments);
    if(ModalRoute.of(context)!.settings.arguments != null){
      Object? arg = ModalRoute.of(context)!.settings.arguments;
      var newLivre= jsonDecode(arg.toString());
      setState(() {
        _Produit = _Produit.then<List>((idProduit) {return [newLivre, ...idProduit];});
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("liste des produits"),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: _Produit,
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