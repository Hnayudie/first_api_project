abstract class WeatherEvent{}

class FetchWeatherByCity extends WeatherEvent{
  final String cityName;

  FetchWeatherByCity(this.cityName);
}

class FetchWeatherByLocation extends WeatherEvent{}