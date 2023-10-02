// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_cubit.dart';
import 'package:weatherupdated/model/weather_model.dart';

class InfoWeatherApp extends StatelessWidget {
  const InfoWeatherApp({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getColor(
                weatherModel.weatherCondition),
          getColor(
                weatherModel.weatherCondition)[300]!,
          getColor(
                weatherModel.weatherCondition)[50]!, 
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'maxTemp :${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'minTemp :${weatherModel.minTemp.round()} ',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  MaterialColor getColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  if (condition == 'sunny' || condition == 'clear') {
    return Colors.amber;
  } else if (condition == 'partly cloudy') {
    return Colors.blueGrey;
  } else if (condition == 'cloudy' || condition == 'overcast') {
    return Colors.grey;
  } else if (condition == 'mist' ||
      condition == 'patchy sleet possible' ||
      condition == 'light sleet' ||
      condition == 'moderate or heavy sleet' ||
      condition == 'blowing snow' ||
      condition == 'blizzard') {
    return Colors.blue;
  } else if (condition == 'patchy rain possible' ||
      condition == 'patchy light drizzle' ||
      condition == 'light drizzle' ||
      condition == 'patchy light rain' ||
      condition == 'patchy snow possible' ||
      condition == 'light snow' ||
      condition == 'patchy light snow' ||
      condition == 'patchy moderate snow' ||
      condition == 'patchy freezing drizzle possible' ||
      condition == 'light freezing drizzle' ||
      condition == 'moderate or heavy freezing rain') {
    return Colors.lightBlue;
  } else if (condition == 'thundery outbreaks possible' ||
      condition == 'patchy light rain with thunder' ||
      condition == 'moderate or heavy rain with thunder' ||
      condition == 'patchy light snow with thunder' ||
      condition == 'moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else if (condition == 'fog' || condition == 'freezing fog') {
    return Colors.grey;
  } else if (condition == 'heavy freezing drizzle' ||
      condition == 'heavy rain at times' ||
      condition == 'heavy rain' ||
      condition == 'heavy snow' ||
      condition == 'ice pellets' ||
      condition == 'torrential rain shower' ||
      condition == 'moderate or heavy sleet showers' ||
      condition == 'moderate or heavy snow showers' ||
      condition == 'moderate or heavy showers of ice pellets' ||
      condition == 'moderate or heavy rain with thunder' ||
      condition == 'moderate or heavy snow with thunder') {
    return Colors.red;
  } else {
    // Default color for unknown conditions
    return Colors.blue;
  }
}

}
