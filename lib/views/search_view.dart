import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modls/modl_weather.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/cubits/getWeatherCupit/getWeatherCubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "search a City",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) {
                var getWeatherCubit = BlocProvider.of<GetWaetherCubit>(context);
                getWeatherCubit.getWeather(cityname: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  hintText: "Enter city Name",
                  labelText: "search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.green))),
            ),
          ),
        ));
  }
}
