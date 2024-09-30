import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrentWeather {
  String? place;
  int? temperature;
  String? weatherSummary;
  int? minimumTemperature;
  int? maximumTemperature;
  int? airQuality;
  String? airQualitySummary;

  CurrentWeather(
      {this.place,
      this.temperature,
      this.weatherSummary,
      this.minimumTemperature,
      this.maximumTemperature,
      this.airQuality,
      this.airQualitySummary});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    temperature = json['temperature'];
    weatherSummary = json['weather_summary'];
    minimumTemperature = json['minimum_temperature'];
    maximumTemperature = json['maximum_temperature'];
    airQuality = json['air_quality'];
    airQualitySummary = json['air_quality_summary'];
  }
}

Future<List<CurrentWeather>> getCurrentWeatherDetails() async {
  var url = Uri.parse(
      "https://raw.githubusercontent.com/Surya-Digital-Interviews/weather-api-public/main/get-current-weather.txt");
  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  final String jsonString = jsonEncode(response.body);
  final List body = json.decode(jsonString);
  // print(body);
  return body.map((e) => CurrentWeather.fromJson(e)).toList();
}
