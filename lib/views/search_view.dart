// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/widgets/weather_data.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  String? cityName;

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              try {
                WeatherModel weatherModel = await WeatherService().getWeather(
                  cityName: cityName!,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => WeatherData(weatherModel: weatherModel),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'City not found. Please enter a valid city name.',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
