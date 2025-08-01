import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!;
    
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherModel.getThemeColor(BlocProvider.of<WeatherCubit>(context).weatherModel!.weatherStateName)[100]!,
              weatherModel.getThemeColor(BlocProvider.of<WeatherCubit>(context).weatherModel!.weatherStateName)[300]!,
              weatherModel.getThemeColor(BlocProvider.of<WeatherCubit>(context).weatherModel!.weatherStateName),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Text(weatherModel.cityName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            Text(
              'Updated: ${weatherModel.date.substring(weatherModel.date.length - 5)}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      weatherModel.icon,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${weatherModel.avgtemp.toInt()}°',
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('max: ${weatherModel.maxTemp.toInt()}°'),
                        Text('min: ${weatherModel.minTemp.toInt()}°'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(height: 20),
            Text(weatherModel.weatherStateName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            Spacer(flex: 5),
          ],
        ),
      );
  }
}
