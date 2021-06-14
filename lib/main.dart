import 'package:api_bloc/bloc/Weather_Bloc.dart';
import 'package:api_bloc/serchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/Weather_repo.dart';
import 'model/Weather_model.dart';

void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Weather'),
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(WeatherRepo()),
        child: search(),
      ),
    );
  }
}


