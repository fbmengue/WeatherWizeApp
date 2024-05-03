// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({
    required this.apiKey,
  });

  Future<Weather> getWeather(int cityID) async {
    final response =
        await http.get(Uri.parse('$URL?id=$cityID&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to display the weather, try again in a moment!');
    }
  }
}
