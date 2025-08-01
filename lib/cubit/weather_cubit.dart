import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(InitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(LoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(CorrectDataState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
