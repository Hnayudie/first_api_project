import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'locationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:first_api_project/services/weather.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();
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
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
