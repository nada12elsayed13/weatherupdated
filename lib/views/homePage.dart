import 'package:flutter/material.dart';
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
      body: const NoWeatherAPP(),
    );
  }
}
