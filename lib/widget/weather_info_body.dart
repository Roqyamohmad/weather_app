import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCupit/getWeatherCubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/modls/modl_weather.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWaetherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weather.condition),
            getThemeColor(weather.condition)[300]!,
            getThemeColor(weather.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image,
                ),
                Text("${weatherModel.temp}"),
                Column(
                  children: [
                    Text(
                      "Maxtemp:${weatherModel.maxtemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Mintemp:${weatherModel.mintemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            Text(
              weatherModel.condition,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
