import 'package:first_api_project/bloc/weather_event.dart';
import 'package:first_api_project/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_api_project/services/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherModel weatherModel;

  WeatherBloc(this.weatherModel) : super(WeatherInitial()) {
    on<FetchWeatherByCity>(_fetchWeatherByCity);
    on<FetchWeatherByLocation>(_fetchWeatherByLocation);
  }

  Future<void> _fetchWeatherByCity(FetchWeatherByCity event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherData = await weatherModel.getCityWeather(event.cityName);
      emit(WeatherLoaded(weatherData));
    } catch (e) {
      emit(WeatherError("Error"));
    }
  }

  Future<void> _fetchWeatherByLocation(FetchWeatherByLocation event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    try {
      final weatherData = await weatherModel.getLocationWeather();
      emit(WeatherLoaded(weatherData));
    } catch (e) {
      emit(WeatherError("error"));
    }
  }
}