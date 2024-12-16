import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCupit/getWeatherCubit.dart';
import 'package:weather_app/cubits/getWeatherCupit/statesGetWeather.dart';
import 'package:weather_app/modls/modl_weather.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/no_weather_body.dart';
import 'package:weather_app/widget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather app"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWaetherCubit, WeatherState>(
        builder: (context, states) {
          if (states is NoWeatherState) {
            return const NoWeatherBody();
          } else if (states is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: states.weatherModel,
            );
          } else {
            return const Text("OPPS there was in error");
          }
        },
      ),
    );
  }
}
