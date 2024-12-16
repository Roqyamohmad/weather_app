import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/modls/modl_weather.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '73fb40fe34564341a3d180004242811';
  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityname');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops there was an error please try again";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error please try again");
    }
  }
}
