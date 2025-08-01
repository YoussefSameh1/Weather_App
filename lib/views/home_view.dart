import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_data.dart';
import 'package:weather_app/widgets/weather_data.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
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
            backgroundColor: (state is CorrectDataState)
                ? BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(BlocProvider.of<WeatherCubit>(context).weatherModel!.weatherStateName)
                : Colors.blue,
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
          body: () {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CorrectDataState) {
              return WeatherData();
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  'Something went wrong, please try again',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              );
            } else {
              return NoWeatherData();
            }
          }(),
        );
      },
    );
  }
}
