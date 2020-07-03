//aqui vai ficar a logica de todo o app
//events =>                                                 bloc =>                           state
// 2 Textfield nome,cantor,ano e slider  [adiciona event]    ||           card roxo listview(5 S2 nome cantor como subtitulo e ano como trailing) MANDAR ISSO PRO FIREBASE
// 3 edita                               [edita event]       ||           aparecer os dados do firebas já pré estabelecidos
// 3 Textfield nome,cantor,ano e slider  [edita event]       ||           alterar dados no card e adicionar ao firebase
// 3 apagar                              [apagar event]      VV           apagar dados do firebase e o próprio card

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edita.dart';


Widget buildListMusica(BuildContext context,DocumentSnapshot document){
var cantor = document['cantor'];
var ano = document['ano'];
String documentID= document.documentID;


  return
    Padding(padding: EdgeInsets.only(left: 16.0,top: 10.0,right: 16.0,bottom: 0.0),
        child:Card(color: Colors.purple[400],
            child:
             ListTile(
                title: Text(document['nome'],style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),),
                subtitle: Text('$cantor - $ano', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                trailing: Row( mainAxisSize: MainAxisSize.min,
                    children:[
                      Text(document['estrelas'].toString(),
                         style: TextStyle(fontWeight: FontWeight.w500, color:Colors.white,fontSize: 19), ),
                      Icon(Icons.favorite,color: Colors.white,size: 20,),]
                ),



                leading:  IconButton(icon: Icon(Icons.edit),
                  color: Colors.black,
                  iconSize:20,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => editaPage(context,document)));

                  },)

            )
        )

    );
}

// montar a lista (1) conforme os dados do firebase

montaLista(context){
  return
    StreamBuilder(
  stream: Firestore.instance.collection('musica').snapshots(),
      builder:(context,snapshot){
if(!snapshot.hasData) return const Text('Carregando...');
return ListView.builder(
  scrollDirection: Axis.vertical,
  itemExtent: 80.0,
  itemCount: snapshot.data.documents.length,
  itemBuilder: (context, index) =>
    buildListMusica(context,snapshot.data.documents[index]),


);
  },
  );

}



