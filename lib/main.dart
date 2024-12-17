import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCupit/getWeatherCubit.dart';
import 'package:weather_app/cubits/getWeatherCupit/statesGetWeather.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWaetherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWaetherCubit, WeatherState>(
                  builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      useMaterial3: false,
                      primarySwatch: getThemeColor(
                          BlocProvider.of<GetWaetherCubit>(context)
                              .weatherModel
                              ?.condition)),
                  home: const HomeView(),
                );
              })),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  return MaterialColor(
    color.value,
    <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color,
    },
  );
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
      return createMaterialColor(Colors.deepPurple);
    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
      return createMaterialColor(Colors.lightBlueAccent);
    case 'moderate rain':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.indigo;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
      return createMaterialColor(Colors.white);
    case 'heavy snow':
    case 'blizzard':
      return createMaterialColor(Colors.blue.shade100);
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepOrange;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.cyan;
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.teal;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    default:
      return createMaterialColor(Colors.blue);
  }
}
