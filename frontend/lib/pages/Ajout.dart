import 'package:flutter/material.dart';
import 'package:flutterapp/produit.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Ajout extends StatefulWidget {
  const Ajout({ Key? key }) : super(key: key);

  @override
  State<Ajout> createState() => _AjoutState();
}

class _AjoutState extends State<Ajout> {
  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? title;
  String? body;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: const Text("Nouveau produit"),
        ),
        backgroundColor : Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _AjoutUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
      ),
    );
  }
  Widget _AjoutUI(BuildContext context){
    return SingleChildScrollView(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOM
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 15,
              bottom: 10
            ),
            child: Text("Nom :", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue 
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "nom_produit",
            "nom du produit",
            (onValidateVal){
              if(onValidateVal.isEmpty){
                return "Le nom ne peut être vide";
              }
              return null;
            },
            (onSaved){
              title = onSaved;
            },
            borderFocusColor: Colors.blue,
            borderColor: Colors.blue,
            textColor: Colors.blue,
            hintColor: Colors.blue.withOpacity(0.8),
            borderRadius: 10
            ),
          // MARQUE
          const Padding(
            padding: EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10
            ),
            child: Text("Marque :", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
            ),
            ),
          ),
            FormHelper.inputFieldWidget(
              context,
              "nom_produit",
              "marque du produit",
                  (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "La marque ne peut être vide";
                }
                return null;
              },
                  (onSaved){
                title = onSaved;
              },
              borderFocusColor: Colors.blue,
              borderColor: Colors.blue,
              textColor: Colors.blue,
              hintColor: Colors.blue.withOpacity(0.8),
              borderRadius: 10
            ),
          // POIDS
          const Padding(
            padding: EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10
            ),
            child: Text("Poids :", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
            ),
            ),
          ),
          FormHelper.inputFieldWidget(
              context,
              "nom_produit",
              "poids du produit",
                  (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "Le poids ne peut être vide";
                }
                return null;
              },
                  (onSaved){
                title = onSaved;
              },
              borderFocusColor: Colors.blue,
              borderColor: Colors.blue,
              textColor: Colors.blue,
              hintColor: Colors.blue.withOpacity(0.8),
              borderRadius: 10
          ),
            // TAILLE
            const Padding(
              padding:  EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child:  Text("Taille :", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue 
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child:  FormHelper.inputFieldWidget(
                context, 
                "marque_produit",
                "taille du produit",
                (onValidateVal){
                  if(onValidateVal.isEmpty){
                    return "La taille ne peut être vide";
                  }
                  return null;
                }, 
                (onSaved){
                  body = onSaved;
                },
                borderFocusColor: Colors.blue,
                borderColor: Colors.blue,
                textColor: Colors.blue,
                hintColor: Colors.blue.withOpacity(0.8),
                borderRadius: 10,
                ),
                
                
            ),
          // QUANTITE
          const Padding(
            padding:  EdgeInsets.only(top:10,left: 20,),
            child:  Text("Quantite :", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child:  FormHelper.inputFieldWidget(
              context,
              "marque_produit",
              "quantite du produit",
                  (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "La quantité ne peut être vide";
                }
                return null;
              },
                  (onSaved){
                body = onSaved;
              },
              borderFocusColor: Colors.blue,
              borderColor: Colors.blue,
              textColor: Colors.blue,
              hintColor: Colors.blue.withOpacity(0.8),
              borderRadius: 10,
            ),

          ),

          // PRIX
          const Padding(
            padding:  EdgeInsets.only(top:10,left: 20,),
            child:  Text("Prix :", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:10),
            child:  FormHelper.inputFieldWidget(
              context,
              "marque_produit",
              "prix du produit",
                  (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "Le prix ne peut être vide";
                }
                return null;
              },
                  (onSaved){
                body = onSaved;
              },
              borderFocusColor: Colors.blue,
              borderColor: Colors.blue,
              textColor: Colors.blue,
              hintColor: Colors.blue.withOpacity(0.8),
              borderRadius: 10,
            ),

          ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormHelper.submitButton(
                "Validez",
                (){
                  dynamic validate = globalFormKey.currentState?.validate();
                  if(validate != null && validate){
                    globalFormKey.currentState?.save();
                    Produit.ajout(context, title, body);
                  }
                },
                btnColor: Colors.blue,
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10
               ) ,
            )

          ]
        ),
      );
  }
}