import 'package:flutter/foundation.dart';
import 'package:weather_app/src/api/api_repository.dart';
import 'package:weather_app/src/model/current_weather_data.dart';

class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=df2be6f58996f87223fa900c8ab34233';

  WeatherService({@required this.city});

  void getCurrentWeatherData({
    Function() beforSend,
    Function(CurrentWeatherData currentWeatherData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }
}
