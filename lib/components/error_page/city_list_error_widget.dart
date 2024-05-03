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

class CityListErrorWidget extends StatefulWidget {
  const CityListErrorWidget({super.key});

  @override
  State<CityListErrorWidget> createState() => _CityListErrorWidgetState();
}

class _CityListErrorWidgetState extends State<CityListErrorWidget> {
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
            padding: EdgeInsets.only(top: 20, right: 50, left: 50, bottom: 15),
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                "Something went wrong!"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                "Maybe the city you selected is under Aliens Atack. Try selecting another city."),
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
