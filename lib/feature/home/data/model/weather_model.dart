// class WeatherModel {
//   final String city;
//   final double temperature;
//   final String description;
//   final int humidity;
//   final double windSpeed;
//   final List<ForecastDay> forecast;
//
//   WeatherModel({
//     required this.city,
//     required this.temperature,
//     required this.description,
//     required this.humidity,
//     required this.windSpeed,
//     required this.forecast,
//   });
//
//   factory WeatherModel.fromJson(Map<String, dynamic> current, Map<String, dynamic> forecastJson) {
//     List<ForecastDay> forecast = (forecastJson['daily'] as List)
//         .sublist(1, 8)
//         .map((day) => ForecastDay.fromJson(day))
//         .toList();
//
//     return WeatherModel(
//       city: current['name'],
//       temperature: current['main']['temp'].toDouble(),
//       description: current['weather'][0]['description'],
//       humidity: current['main']['humidity'],
//       windSpeed: current['wind']['speed'].toDouble(),
//       forecast: forecast,
//     );
//   }
// }
//
// class ForecastDay {
//   final double minTemp;
//   final double maxTemp;
//   final String description;
//   final DateTime date;
//
//   ForecastDay({
//     required this.minTemp,
//     required this.maxTemp,
//     required this.description,
//     required this.date,
//   });
//
//   factory ForecastDay.fromJson(Map<String, dynamic> json) {
//     return ForecastDay(
//       minTemp: json['temp']['min'].toDouble(),
//       maxTemp: json['temp']['max'].toDouble(),
//       description: json['weather'][0]['description'],
//       date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
//     );
//   }
// }
class WeatherModel {
  final String city;
  final double temperature;
  final String conditionText;
  final int humidity;
  final double windKph;
  final List<ForecastDay> forecast;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.conditionText,
    required this.humidity,
    required this.windKph,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    final current = json['current'];
    final forecastDays = json['forecast']['forecastday'] as List;

    List<ForecastDay> forecast = forecastDays
        .map((day) => ForecastDay.fromJson(day))
        .toList();

    return WeatherModel(
      city: location['name'],
      temperature: (current['temp_c'] as num).toDouble(),
      conditionText: current['condition']['text'],
      humidity: current['humidity'],
      windKph: (current['wind_kph'] as num).toDouble(),
      forecast: forecast,
    );
  }
}

class ForecastDay {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String conditionText;

  ForecastDay({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.conditionText,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: DateTime.parse(json['date']),
      minTemp: (json['day']['mintemp_c'] as num).toDouble(),
      maxTemp: (json['day']['maxtemp_c'] as num).toDouble(),
      conditionText: json['day']['condition']['text'],
    );
  }
}
