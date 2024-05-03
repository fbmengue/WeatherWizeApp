// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Weather {
  final String? cityName;
  final String? temperatureConditions;
  final double celsiusTemperature;
  final int humidity;
  final double windSpeed;
  final int? dt;
  String? time;
  String? image;
  IconData? windIcon;
  Weather(
      {required this.cityName,
      required this.temperatureConditions,
      required this.celsiusTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.dt,
      this.time,
      this.image,
      this.windIcon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        celsiusTemperature: json['main']['temp'],
        temperatureConditions: json['weather'][0]['main'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        image: json['weather'][0]['main'],
        dt: json['dt']);
  }

  /*
  Get the API time integer and convert to a readable date and time
  */
  convertTime(int? dt) {
    DateTime date;
    if (dt != null) {
      // Multiply the API time to use the miliseconds representation
      date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
      // if day has 1 number, adds the "0" in front.
      String day =
          (date.day.toString().length == 1) ? "0${date.day}" : "${date.day}";
      // if month has 1 number, adds the "0" in front.
      String month = (date.month.toString().length == 1)
          ? "0${date.month}"
          : "${date.month}";
      int year = date.year;
      int hour = date.hour;
      // if min has 1 number, adds the "0" in front.
      String min = (date.minute.toString().length == 1)
          ? "0${date.minute}"
          : "${date.minute}";

      int seconds = date.second;
      time = "$day-$month-$year $hour:$min:$seconds";
    } else {
      time = "something went wrong! Try again!";
    }
  }

  /*
  Verify the gereric weather conditions to set the correct 3d model
  */
  set3dModel() {
    switch (temperatureConditions) {
      case "Clouds":
        image = "assets/images/3d/2-cloud-sun-6.obj";
        break;
      case "Clear":
        image = "assets/images/3d/sun.obj";
        break;
      case "Rain":
        image = "assets/images/3d/rain-2.obj";
        break;
      default:
        image = "assets/images/3d/sun.obj";
    }
  }

  /*
  Verify the wind speed to set the correct icon for the beaufort scale
  */
  setBeaufortScale() {
    switch (windSpeed) {
      case <= 0.2:
        windIcon = WeatherIcons.wind_beaufort_0;
        break;
      case <= 1.5:
        windIcon = WeatherIcons.wind_beaufort_1;
        break;
      case <= 3.3:
        windIcon = WeatherIcons.wind_beaufort_2;
        break;
      case <= 5.4:
        windIcon = WeatherIcons.wind_beaufort_3;
        break;
      case <= 7.9:
        windIcon = WeatherIcons.wind_beaufort_4;
        break;
      case <= 10.7:
        windIcon = WeatherIcons.wind_beaufort_5;
        break;
      case <= 13.8:
        windIcon = WeatherIcons.wind_beaufort_6;
        break;
      case <= 17.1:
        windIcon = WeatherIcons.wind_beaufort_7;
        break;
      case <= 20.7:
        windIcon = WeatherIcons.wind_beaufort_8;
        break;
      case <= 24.4:
        windIcon = WeatherIcons.wind_beaufort_9;
        break;
      case <= 28.4:
        windIcon = WeatherIcons.wind_beaufort_10;
        break;
      case <= 32.6:
        windIcon = WeatherIcons.wind_beaufort_11;
        break;
      case >= 32.7:
        windIcon = WeatherIcons.wind_beaufort_12;
        break;
      default:
        windIcon = WeatherIcons.wind_beaufort_0;
    }
  }
}
