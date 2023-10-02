import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherupdated/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e545df9387d841b2aec192351232809';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'OOPS there was an error,Try Later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('OOPS there was an error,Try Later!');
    }
  }
}
