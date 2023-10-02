import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_cubit.dart';
import 'package:weatherupdated/cubits/get_weathe_cubit/get_weather_states.dart';
import 'package:weatherupdated/views/searchPage.dart';
import 'package:weatherupdated/widget/infoWeatherAPP.dart';

import '../widget/noWeatherApp.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherAPP();
          } else if (state is WeatherLoadedState) {
            return InfoWeatherApp(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Text('OOPS There exists an Error!');
          }
        },
      ),
    );
  }
}
