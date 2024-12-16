import 'package:weather_app/modls/modl_weather.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailurState extends WeatherState {}
