import 'package:flutter/material.dart';
import 'package:weatherwize_app/components/weather_page/humidity_widget.dart';
import 'package:weatherwize_app/components/weather_page/wind_speed_widget.dart';

class WeatherBottomWidget extends StatefulWidget {
  final double? windSpeed;
  final IconData? windIcon;
  final int? humidity;

  const WeatherBottomWidget({
    super.key,
    required this.windSpeed,
    required this.windIcon,
    required this.humidity,
  });

  @override
  State<WeatherBottomWidget> createState() => _WeatherBottomWidgetState();
}

/*
  Widget that render a container with a Column with 2 Rows 
  First Row renders the header/title section
  Second Row renders the two sections widgets about Humudity and Wind Speed
*/
class _WeatherBottomWidgetState extends State<WeatherBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Weather Details",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WindSpeedWidget(
                windIcon: widget.windIcon,
                windSpeed: widget.windSpeed,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              HumidityWidget(
                humidity: widget.humidity,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
