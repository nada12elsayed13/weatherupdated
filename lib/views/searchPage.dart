

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherupdated/model/weather_model.dart';
import 'package:weatherupdated/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
                weatherModel = await WeatherServices(Dio())
                  .getCurrentWeather(cityName: value);
                  Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: 'Enter City Name',
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
        ),
      ),
    );
  }
}
WeatherModel? weatherModel;
