import 'dart:convert';

import 'package:flutter_poc/services/weatherResponseModel.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponseAPI> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'c6d632eb0af5f474146b444913204697'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final res = await http.get(uri);

    // print(res.body + " ----------------------------------");

    final jsonRes = jsonDecode(res.body);
    return WeatherResponseAPI.fromJson(jsonRes);
  }
}
