import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '9c0294a5587048eab9d141721251206';

    var response = await http.get(
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no'),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weatherModel = WeatherModel.fromJson(data);

    return weatherModel;
  }
}
