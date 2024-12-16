import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCupit/statesGetWeather.dart';
import 'package:weather_app/modls/modl_weather.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWaetherCubit extends Cubit<WeatherState> {
  GetWaetherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;

  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailurState());
    }
  }
}
