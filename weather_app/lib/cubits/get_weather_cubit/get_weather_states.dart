import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedStates extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedStates({required this.weatherModel});
}

class WeatherFailureStates extends WeatherState {
  final String errMsg;

  WeatherFailureStates({required this.errMsg});
}
