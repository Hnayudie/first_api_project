import 'package:flutter/material.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:first_api_project/services/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import 'locationScreen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeatherByLocation());
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if(state is WeatherLoading) {
            return Center(
              child: SpinKitThreeBounce(color: Colors.white, size: 50),
            );
          } else if (state is WeatherLoaded) {
            return LocationScreen(locationWeather: state.weatherData);
          } else if (state is WeatherError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: Text("?"),
            );
          }
        }
      ),
    );
  }
}
