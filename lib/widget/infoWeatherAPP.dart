import 'package:flutter/material.dart';

class InfoWeatherApp extends StatelessWidget {
  const InfoWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Alexandria',
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
