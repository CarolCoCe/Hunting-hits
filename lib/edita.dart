import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cesar/editaBloc.dart';

String docID;

Widget editaPage(BuildContext context,DocumentSnapshot document){
  var nome = document['nome'];
  docID= document.documentID;



  return
            Scaffold(
                   appBar : AppBar( centerTitle: true,title: Text('Editar: $nome',style: TextStyle(color: Colors.white ,fontSize:20.0,)),
                     backgroundColor:Colors.purple[400], ),
                body: Container(  child:
                (
                EditFire()
                )
                ),
            );


}
String pegaid(){


  String documentID = docID;
  return documentID;
}

