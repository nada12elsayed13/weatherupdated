import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_cubit.dart';

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
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
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
