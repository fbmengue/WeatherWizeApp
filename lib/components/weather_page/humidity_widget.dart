import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

class HumidityWidget extends StatefulWidget {
  final int? humidity;

  const HumidityWidget({super.key, required this.humidity});

  @override
  State<HumidityWidget> createState() => _HumidityWidgetState();
}

class _HumidityWidgetState extends State<HumidityWidget> {
  @override
  void initState() {
    super.initState();
  }

  /*
  Widget that render a container with a Column with 1 Rows about and elements
  First Row renders the section title about the topic with a Icon
  The elements are Icon representation of humidity and the currently value from the Api
*/
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).colorScheme.background),
      padding: const EdgeInsets.all(0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Container(
                width: 95,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(71, 184, 174, 1),
                              Color.fromRGBO(77, 183, 190, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2, 0.5]),
                      ),
                      child: IconButton(
                        icon: const Icon(WeatherIcons.humidity),
                        onPressed: () {},
                        iconSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Humidity",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(WeatherIcons.humidity),
          onPressed: () {},
          iconSize: 75,
        ),
        Text(
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          "${widget.humidity}",
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
