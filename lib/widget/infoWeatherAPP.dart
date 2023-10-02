// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_cubit.dart';

import 'package:weatherupdated/model/weather_model.dart';

class InfoWeatherApp extends StatelessWidget {
  const InfoWeatherApp({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(
          weatherModel.cityName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'updated at : 23:64',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/snow.png'),
            const Text(
              '17',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Column(
              children: [
                Text('maxTemp :24'),
                Text('minTemp :16 '),
              ],
            ),
          ],
        ),
        const Text(
          'Light Rain',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
