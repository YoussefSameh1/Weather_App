import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  String date;
  String icon;
  String weatherStateName;
  double avgtemp;
  double maxTemp;
  double minTemp;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.icon,
    required this.weatherStateName,
    required this.avgtemp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
      cityName: data['location']['name'],
      date: data['location']['localtime'],
      icon: 'https:${jsonData['day']['condition']['icon']}',
      weatherStateName: jsonData['day']['condition']['text'], 
      avgtemp: jsonData['day']['avgtemp_c'],
      maxTemp: jsonData['day']['maxtemp_c'],
      minTemp: jsonData['day']['mintemp_c'],
    );
  }

  @override
  String toString() {
    return 'WeatherModel(cityName: $cityName, date: $date, icon: $icon, weatherStateName: $weatherStateName, avgtemp: $avgtemp, maxTemp: $maxTemp, minTemp: $minTemp)';
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
