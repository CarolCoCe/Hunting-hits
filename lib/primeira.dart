
import 'package:cesar/primeiraBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cesar/adiciona.dart';
import 'package:cesar/edita.dart';

class PrimeiraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar : AppBar(
        title: Text('Projetinho de Ana Carolina Costa César',
            style: TextStyle(color: Colors.white ,fontSize:20.0,)),
        backgroundColor:Colors.purple[400],
      ),
      body: MyCentro(),

      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdicionaPage()));

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[700],

      )
      ,
    );
  }
}

class MyCentro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(padding: const EdgeInsets.all(2.0),
           child: Column(
            children:
              [Image.network('https://conteudo.imguol.com.br/c/noticias/53/2019/06/25/cantar-cantoria-cantores-karaoke-cantando-musica-1561513481509_v2_900x506.jpg'),
                Text('Hunting Hits', style: TextStyle(color: Colors.black87,fontSize: 40.00,fontWeight: FontWeight.w700),),
                  Expanded( child:montaLista(context)   ),
              ],
                    )

    ));
  }
}

















