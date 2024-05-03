import 'package:flutter/material.dart';
import 'package:weatherwize_app/components/error_page/city_list_error_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  /*
  Error page with a custom background image and a custom container meassage
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary)),
          onPressed: () =>
              {Navigator.popUntil(context, ModalRoute.withName('/'))},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/error.png"),
                fit: BoxFit.cover)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [CityListErrorWidget()],
            ),
          ],
        ),
      ),
    );
  }
}
