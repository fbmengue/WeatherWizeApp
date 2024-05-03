import 'package:flutter/material.dart';
import 'package:weatherwize_app/components/weather_page/weather_bottom_widget.dart';
import 'package:weatherwize_app/components/weather_page/weather_card_widget.dart';
import 'package:weatherwize_app/components/weather_page/weather_header_widget.dart';
import 'package:weatherwize_app/models/weather_model.dart';
import 'package:weatherwize_app/services/weather_service.dart';
import 'package:weatherwize_app/views/error_page.dart';
import 'package:weatherwize_app/views/loading_page.dart';

class WeatherPage extends StatefulWidget {
  final String cityName;
  const WeatherPage({super.key, required this.cityName});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService =
      WeatherService(apiKey: '3b725308b88a057670d7739ba6e1f701');
  Weather? _weather;
  late bool _isLoading;
  int cityID = 0;

  //function to get the weather from
  _getWeather() async {
    // Get the selected city name from dropdown and translate to city ID for the API
    switch (widget.cityName) {
      case "Lisboa":
        cityID = 2267056;
        break;
      case "Leiria":
        cityID = 2267094;
        break;
      case "Coimbra":
        cityID = 2740636;
        break;
      case "Porto":
        cityID = 2735941;
        break;
      case "Faro":
        cityID = 2268337;
        break;
      default:
    }

    // Try to Get the info for the city selected
    try {
      final weather = await _weatherService.getWeather(cityID);
      setState(() {
        _weather = weather;
        //Convert the time integer from the API to a readable Data and time
        _weather?.convertTime(_weather?.dt);
        // Verify and Set the wind speed to the correct beaufort scale
        _weather?.setBeaufortScale();
        // Identify the currently weather condition to set the correctly path to the 3d model
        _weather?.set3dModel();
      });
    } catch (e) {
      // If any exception redirect the user to the erro page.
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ErrorPage()));
    }
  }

  @override
  void initState() {
    _isLoading = true;
    _getWeather();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  /*
  Widget that renders the weather page with 3 sections
  Header with the city name, date and time
  The weather card with the 3d model representation, city name, tempeture in celcius and generic condition
  Bottom widget with a header and 2 columns with details (humidity and wind speed)
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary)),
          onPressed: () =>
              {Navigator.popUntil(context, ModalRoute.withName('/'))},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: _isLoading
            ? const LoadingPage()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WeatherHeaderWidget(
                    celsiusTemperature:
                        '${_weather?.celsiusTemperature.round().toString()} °C',
                    temperatureConditions: _weather?.temperatureConditions,
                    time: _weather?.time,
                    cityName: _weather?.cityName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WeatherCardWidget(
                    image: _weather?.image,
                    celsiusTemperature:
                        '${_weather?.celsiusTemperature.round().toString()}°C',
                    temperatureConditions: _weather?.temperatureConditions,
                    cityName: _weather?.cityName,
                  ),
                  WeatherBottomWidget(
                    windIcon: _weather?.windIcon,
                    humidity: _weather?.humidity,
                    windSpeed: _weather?.windSpeed,
                  )
                ],
              ),
      ),
    );
  }
}
