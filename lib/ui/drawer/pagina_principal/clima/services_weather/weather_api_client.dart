////inicia la llamada algun http request en flutter
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smt_app/ui/drawer/pagina_principal/clima/modelo/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location, String? country) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location, $country&appid=e392bfccbcd21405447c051eb0cfa9f7&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
