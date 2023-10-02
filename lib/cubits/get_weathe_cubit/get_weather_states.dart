// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weatherupdated/model/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({
    required this.weatherModel,
  });
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState({
    required this.errorMessage,
  });
}
