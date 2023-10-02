import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_states.dart';
import 'package:weatherupdated/services/weather_services.dart';

import '../../model/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit(super.initialState);
  
  getWeather({required String cityName})async{
    WeatherModel weatherModel = await WeatherServices(Dio())
                  .getCurrentWeather(cityName: cityName);
                  
  }
}