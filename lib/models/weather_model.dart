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

  MaterialColor getThemeColor(String? state) {
  switch (state) {
    case " ":
      return Colors.amber;
    case null:
      return Colors.amber;
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
    case "Patchy rain possible":
      return Colors.lightGreen;
    case "Patchy snow possible":
    case "Patchy sleet possible":
      return Colors.teal;
    case "Patchy freezing drizzle possible":
      return Colors.cyan;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
    case "Blizzard":
      return Colors.blue;
    case "Fog":
    case "Freezing fog":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
      return Colors.green;
    case "Moderate rain at times":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Ice pellets":
      return Colors.brown;
    case "Light rain shower":
      return Colors.lightGreen;
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Patchy light rain with thunder":
      return Colors.deepOrange;
    case "Moderate or heavy rain with thunder":
      return Colors.red;
    case "Patchy light snow with thunder":
      return Colors.indigo;
    case "Moderate or heavy snow with thunder":
      return Colors.purple;
    default:
      return Colors.grey;
  }
}
}
