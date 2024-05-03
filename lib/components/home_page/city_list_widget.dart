import 'package:flutter/material.dart';
import 'package:weatherwize_app/views/weather_page.dart';

//Dropdown options
const List<String> cityList = <String>[
  'Lisboa',
  'Leiria',
  'Coimbra',
  'Porto',
  'Faro'
];

/*
Widget renders a container > column with a text information and a dropdown menu
Dropdown menu item with city names
*/
class CityListWidget extends StatefulWidget {
  const CityListWidget({super.key});

  @override
  State<CityListWidget> createState() => _CityListWidgetState();
}

class _CityListWidgetState extends State<CityListWidget> {
  String dropdownValue = cityList.first;

  //Widget that build the container with text and the dropdownmenu
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.elliptical(30, 30))),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                "Select a city to explore the map of wind, weather and temperature conditions."),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: DropdownButtonFormField(
              dropdownColor: Theme.of(context).colorScheme.background,
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              value: cityList.first,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WeatherPage(
                            cityName: dropdownValue,
                          )));
                });
              },
              items: cityList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
