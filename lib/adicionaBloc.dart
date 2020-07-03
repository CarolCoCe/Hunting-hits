import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edita.dart';

double estrelas = 0;

class SliderAvalia extends StatefulWidget {
  @override
  _SliderAvaliaState createState() {
    return _SliderAvaliaState();
  }
}

class _SliderAvaliaState extends State {


  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.favorite,color: Colors.red,
            size: 30,
          ),
          new Expanded(
                child: Slider(
                    value: estrelas,
                    min: 0.00,
                    max: 5.00,
                    divisions: 10,
                    activeColor: Colors.lightBlue,
                    inactiveColor: Colors.black,
                    label: '$estrelas',
                    onChanged: (newValue) {
                      setState(() {
                        estrelas= newValue;
                      });
                    },



                ),

          ),
        ]
    );
  }
}





class AddFire extends StatefulWidget {

  @override
  _AddFireState createState() => _AddFireState();
}

class _AddFireState extends State<AddFire> {

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final cantorController = TextEditingController();
    final anoController = TextEditingController();

    _printUltimoNome(){
      print ('$nomeController.text');
    }
    _printUltimoAno(){
      print ('$anoController.text');
    }
    _printUltimoCantor(){
      print ('$cantorController.text');
    }

    nomeController.addListener(_printUltimoNome) ;
    nomeController.addListener(_printUltimoCantor) ;
    nomeController.addListener(_printUltimoAno) ;





      return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(

              children:[
                TextField(
                  controller: nomeController,
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.music_video,color: Colors.red,size: 30),
                    hintText: 'Nome da música',
                  ),
                ),

                TextField(
                    controller: cantorController,
                    autocorrect: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mic,color: Colors.black,size: 30),
                      hintText: 'Cantor(a)',
                    )),

                TextField(
                    controller: anoController,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today,color: Colors.indigo[900],size: 30),
                      hintText: 'Ano de lançamento',

                    )),

                Padding( padding: const EdgeInsets.only(bottom: 0.0,top: 2.0),child:Center(
                    child: Text ('Avaliação:', style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,),))),

                Padding( padding: const EdgeInsets.all(12.0),
                  child:   SliderAvalia(),
                ),


                RaisedButton(
                  child: Padding( padding: EdgeInsets.all(12),child: Text ('Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )
                  ),),


                  color: Colors.green,
                  elevation :7.0,
                  splashColor: Colors.green[900],

                  onPressed:(){

                    Firestore.instance.runTransaction((Transaction transaction) async {
                      CollectionReference reference =
                      Firestore.instance.collection('musica');
                      await reference
                      .add({"nome": nomeController.text, "cantor": cantorController.text, "ano": anoController.text.toString(), "estrelas": estrelas.toString()});
                      nomeController.clear();
                      cantorController.clear();
                      anoController.clear();
                    });

                    Navigator.pop(context);

                  },
                ),


              ]
          )
      );




  }
}


// Pra quando for aplicar o bloc vvv

//"estrelas": estrelas.toString()
