import 'package:flutter/material.dart';

class WeatherHeaderWidget extends StatefulWidget {
  final String? cityName;
  final String? celsiusTemperature;
  final String? temperatureConditions;
  final String? time;

  const WeatherHeaderWidget(
      {super.key,
      required this.cityName,
      required this.celsiusTemperature,
      required this.temperatureConditions,
      required this.time});

  @override
  State<WeatherHeaderWidget> createState() => _WeatherHeaderWidgetState();
}

/*
Widget that renders the weather page header with a Icon, City name, date and time
*/
class _WeatherHeaderWidgetState extends State<WeatherHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_sharp,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  widget.cityName ?? "vazio"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 36,
              ),
              Text(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                  "${widget.time}"),
            ],
          )
        ],
      ),
    );
  }
}
