import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherwize_app/components/home_page/city_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

/*
Widget that renders a background image and a container with a dropdown menu
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'WeatherWize',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(children: [
        SvgPicture.asset(
          'assets/images/home.svg',
          fit: BoxFit.cover,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [CityListWidget()],
            ),
          ],
        ),
      ]),
    );
  }
}
