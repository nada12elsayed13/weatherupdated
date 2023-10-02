import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_cubit.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_states.dart';

import 'package:weatherupdated/views/homePage.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
                theme: ThemeData(
                    primarySwatch: getColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition)),
                debugShowCheckedModeBanner: false,
                home: const HomePage());
          },
        ),
      ),
    );
  }
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
      return Colors.blue;
    }
  }

