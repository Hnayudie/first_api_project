import 'package:flutter/material.dart';
import 'screen/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/weather.dart';
import 'bloc/weather_bloc.dart';

void main() => runApp (MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
          create: (context) => WeatherBloc(WeatherModel()),
          child: HomePage(),
      ),
    );
  }
}




