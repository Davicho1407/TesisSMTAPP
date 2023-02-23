import 'package:flutter/material.dart';
import 'package:smt_app/ui/drawer/pagina_principal/clima/additional_information.dart';
import 'package:smt_app/ui/drawer/pagina_principal/clima/current_weather.dart';
import 'package:smt_app/ui/drawer/pagina_principal/clima/modelo/weather_model.dart';
import 'package:smt_app/ui/drawer/pagina_principal/clima/services_weather/weather_api_client.dart';

class ClimaPageUser extends StatefulWidget {
  const ClimaPageUser({super.key});

  static Widget create(BuildContext context) => ClimaPageUser();

  @override
  State<ClimaPageUser> createState() => _ClimaPageUserState();
}

class _ClimaPageUserState extends State<ClimaPageUser> {
  //Ahora dejamos prueba si cadacosa trabaja
  //llamamo la api en el init state function
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = await client.getCurrentWeather('Tulcán', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          elevation: 0.0,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/drawerUser');
            }),
          ),
          title: const Text(
            'Clima',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //aqui va la informacion de la api
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(Icons.wb_sunny_rounded, '${data!.temp}°',
                      '${data!.cityName}, ', '${data!.country}'),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Información adicional',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  additionalInformation('${data!.wind}', '${data!.humidity}',
                      '${data!.pressure}', '${data!.feels_like}'),
                ],
              );
            } else {}
            return Container();
          },
        ));
  }
}
