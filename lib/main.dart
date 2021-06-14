import 'package:api_bloc/bloc/Weather_Bloc.dart';
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



class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  final weatherBloc = BlocProvider.of<WeatherBloc>(context);
  var cityController = TextEditingController();
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        BlocBuilder(builder: (context,state){
          if(state is WetherIsnotSearched ){
            return Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          // borderRadius: BorderRadius.circular(0),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.location_on,size: 50,color: Colors.black,)
                      // Text('Weather',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                        width: 250,
                        child: TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            isDense: true,
                            labelText: 'City Name',
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.amber[500]
                        ),
                        onPressed: (){},
                        child: Text("Search")),
                  ),
                ],
              ),
            );
          }
          return Text('s');
        })
      ],
    );

  }
}
class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            Text(city,style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

            Text(weather.getTemp.round().toString()+"C",style: TextStyle(color: Colors.white70, fontSize: 50),),
            Text("Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(weather.getMinTemp.round().toString()+"C",style: TextStyle(color: Colors.white70, fontSize: 30),),
                    Text("Min Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(weather.getMaxTemp.round().toString()+"C",style: TextStyle(color: Colors.white70, fontSize: 30),),
                    Text("Max Temprature",style: TextStyle(color: Colors.white70, fontSize: 14),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: (){
                  BlocProvider.of<WeatherBloc>(context).add(resetwether());
                },
                color: Colors.lightBlue,
                child: Text("Search", style: TextStyle(color: Colors.white70, fontSize: 16),),

              ),
            )
          ],
        )
    );
  }
}

