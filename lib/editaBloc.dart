import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cesar/edita.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//slider
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




class EditFire extends StatefulWidget {

  @override
  _EditFireState createState() => _EditFireState();

}

class _EditFireState extends State<EditFire> {

String docID = pegaid();



  @override

  Widget build(BuildContext context) {

    
    final nomeEditaController = TextEditingController();
    final cantorEditaController = TextEditingController();
    final anoEditaController = TextEditingController();

    _printUltimoNome(){
      print ('$nomeEditaController.text');
    }
    _printUltimoAno(){
      print ('$anoEditaController.text');
    }
    _printUltimoCantor(){
      print ('$cantorEditaController.text');
    }

    nomeEditaController.addListener(_printUltimoNome) ;
    nomeEditaController.addListener(_printUltimoCantor) ;
    nomeEditaController.addListener(_printUltimoAno) ;


    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
            children: [


              Column(
                  children:[

                    TextField(
                      controller:nomeEditaController,
                      autofocus: true,
                      autocorrect: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.music_video,color: Colors.red,size: 30),
                        hintText: 'Nome da música',
                      ),
                    ),

                    TextField(
                        controller: cantorEditaController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.mic,color: Colors.black,size: 30),
                          hintText: 'Cantor(a)',
                        )),

                    TextField(
                        controller: anoEditaController,
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
                  ]
              ),

//botoes de apagar e salvar

              Padding(padding: EdgeInsets.only(left:60,right: 10,top:2,bottom:2),child: Row(

                  children:[
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

                        if(nomeEditaController.text != '' && cantorEditaController.text != '' && anoEditaController.text != '' ) {
                          Firestore.instance.runTransaction((
                              Transaction transaction) async {
                            DocumentReference reference =
                            Firestore.instance.collection('musica').document(docID);
                            await reference
                                .updateData({
                              "nome": nomeEditaController.text,
                              "cantor": cantorEditaController.text,
                              "ano": anoEditaController.text.toString(),
                              "estrelas": estrelas.toString()
                            });
                            nomeEditaController.clear();
                            cantorEditaController.clear();
                            anoEditaController.clear();
                          });
                          Navigator.pop(context);
                        }
                        else {
                          print("Por favor preencha todos os campos");
                        }
                        
                      },
                    ),

                    SizedBox(width: 65, height:10),

                    RaisedButton(
                      child: Padding( padding: EdgeInsets.all(12),child: Text ('Apagar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )
                      ),),


                      color: Colors.red,
                      elevation :7.0,
                      splashColor: Colors.red[900],
                      onPressed:(){
                        Firestore.instance.collection('musica').document(docID).delete();
                        Navigator.pop(context);

                      },
                    )


                  ]
              )
              )
            ]
        )
    );
  }
}


