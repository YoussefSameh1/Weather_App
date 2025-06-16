import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_data.dart';
import 'package:weather_app/widgets/weather_data.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
          ),
        ],
      ),
      body:
          weatherModel == null
              ? NoWeatherData()
              : WeatherData(weatherModel: weatherModel!),
    );
  }
}
