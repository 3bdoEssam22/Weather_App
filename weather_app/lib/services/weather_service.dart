import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String key = 'e20b3f3a7069477b932141928242009';

  WeatherService( this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName&days=10');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMsg = e.response?.data['error']['message'] ??
          'Oops, There were an error. \n Try again later';

      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, There were an error. \n Try again later');
    }
  }
}




// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:weather_app/models/weather_model.dart';

// class WeatherService {
//   final Dio dio;

//   final String baseUrl = 'https://api.weatherapi.com/v1';
//   final String key = 'e20b3f3a7069477b932141928242009';
//   WeatherService({required this.dio});

//   Future<WeatherModel> getCurrentWeather({required String cityName}) async {
//     try {
//       Response response =
//           await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName&days=10');

//       WeatherModel weatherModel = WeatherModel.fromJson(response.data);

//       return weatherModel;
//     } on DioException catch (e) {
//       final String errMsg = e.response?.data['error']['message'] ??
//           'Oops, There were an error. \n Try again later';

//       throw Exception(errMsg);
//     } catch (e) {
//       log(e.toString());
//       throw Exception('Oops, There were an error. \n Try again later');
//     }
//   }
// }
