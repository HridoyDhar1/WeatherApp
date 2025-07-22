// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class WeatherService {
//   static const String apiKey = '';
//
//   Future<Map<String, dynamic>> getCurrentWeather(String city) async {
//     final url =
//         '1f01395384a2c48f69a065023252207';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode != 200) throw Exception('Invalid city');
//     return jsonDecode(response.body);
//   }
//
//   Future<Map<String, dynamic>> getForecast(double lat, double lon) async {
//     final url =
//         'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly,alerts&appid=$apiKey&units=metric';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode != 200) throw Exception('Failed to fetch forecast');
//     return jsonDecode(response.body);
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = 'f01395384a2c48f69a065023252207';

  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    final url =
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather');
    }
    return jsonDecode(response.body);
  }
}
