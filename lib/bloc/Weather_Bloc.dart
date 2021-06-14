
import 'package:api_bloc/model/Weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'Weather_repo.dart';

class Weatherevent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class Fetchwether extends Weatherevent{

  final _city;

  Fetchwether(this._city);
  List<Object> get props => [_city];
}

class resetwether extends Weatherevent{}

class WeatherState extends Equatable{
  @override
  List<Object?> get props =>[];
}

class WetherIsnotSearched extends WeatherState{

}

class WetherIsLoading extends WeatherState{

}

class WetherIsLoaded extends WeatherState{
  final _wether;

  WetherIsLoaded(this._wether);
  WeatherModel get getWeather => _wether;

  @override
  List<Object> get props =>[_wether];
}

class WetherIsNotLoaded extends WeatherState{}

class WeatherBloc extends Bloc<Weatherevent,WeatherState>{
  WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WetherIsnotSearched());


  @override
  Stream<WeatherState> mapEventToState(Weatherevent event) async*{
    if(event is Fetchwether){
      yield WetherIsLoading();

      try{

        WeatherModel weather = weatherRepo.getWeather(event._city) as WeatherModel;
        yield WetherIsLoaded(weather);
      }catch(_){
        WetherIsNotLoaded();
        print(_);
      }
    }else if(event is resetwether){
      WetherIsnotSearched();
    }
  }

}


