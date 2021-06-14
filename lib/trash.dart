/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Myapp(),
  ));
}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  var coounterbloc =Counterbloc();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              coounterbloc.eventsink.add(CounterAction.Incrrement);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: (){
              coounterbloc.eventsink.add(CounterAction.Decrement);
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.loop),
            onPressed: (){
              coounterbloc.eventsink.add(CounterAction.Reset);
            },
          ),



        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: StreamBuilder(
              stream: coounterbloc.counterstream,
                initialData: 0,
                builder: (context,snapshot){

                    return Text('value:- ${snapshot.data}');

                }
            ),
          ),
        ],
      ),
    );
  }
}

 */











/*
import 'dart:async';
enum CounterAction{
  Incrrement,
  Decrement,
  Reset
}

class Counterbloc{

  final _statecontroller = StreamController<int>();
  StreamSink<int> get countersink => _statecontroller.sink;
  Stream<int> get counterstream => _statecontroller.stream;

  final _eventcontroller = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventsink => _eventcontroller.sink;
  Stream<CounterAction> get eventstream => _eventcontroller.stream;

  Counterbloc(){
   int counter = 0;
    eventstream.listen((event) {

      if(event == CounterAction.Incrrement) counter++;

     if(event == CounterAction.Decrement) counter--;

     if(event == CounterAction.Reset) counter = 0;

    countersink.add(counter);
    });
  }

  void dispose(){
    _statecontroller.close();
    _eventcontroller.close();
  }

}
 */