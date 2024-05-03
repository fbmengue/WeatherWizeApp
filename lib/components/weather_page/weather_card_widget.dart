import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cube/flutter_cube.dart';

class WeatherCardWidget extends StatefulWidget {
  final String? cityName;
  final String? celsiusTemperature;
  final String? temperatureConditions;
  final String? image;

  const WeatherCardWidget({
    super.key,
    required this.cityName,
    required this.celsiusTemperature,
    required this.temperatureConditions,
    required this.image,
  });

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  /*
  The card widget, a container with a row and 2 columns
  First column renders the 3d model
  Second column renders city name, temperature and generic conditions
   */
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(71, 184, 174, 1),
                Color.fromRGBO(77, 183, 190, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.5]),
          borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Cube(
                  onSceneCreated: (scene) {
                    scene.world.add(Object(fileName: widget.image));
                    scene.camera.zoom = 10;
                  },
                ),
              ),
            ],
          ),
          Container(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    widget.cityName ?? "vazio"),
                Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 40),
                    widget.celsiusTemperature ?? "vazio"),
                Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    widget.temperatureConditions ?? "vazio"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
