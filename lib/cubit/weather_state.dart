abstract class WeatherState {}

class InitialState extends WeatherState{}

class LoadingState extends WeatherState{}

class CorrectDataState extends WeatherState{}

class ErrorState extends WeatherState{}