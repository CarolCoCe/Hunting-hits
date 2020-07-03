import 'package:flutter/material.dart';
import 'package:cesar/primeira.dart';
import 'package:bloc/bloc.dart';
import 'package:cesar/adicionaBloc.dart';
import 'package:async/async.dart';



class AdicionaPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar : AppBar(
      centerTitle: true,
      title: Text('Adicionar uma nova música:',
          style: TextStyle(color: Colors.white ,fontSize:20.0,)),
      backgroundColor:Colors.purple[400],
    ),
      body: Container(
          child:
          (
              AddFire()

          )
      ),
    );
  }
}














