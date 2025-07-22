import 'package:flutter/material.dart';
import '../../feature/home/data/model/weather_model.dart';

import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchWeatherByCity(String city) async {
    _setLoading(true);
    try {
      final json = await _weatherService.getWeatherByCity(city);
      _weather = WeatherModel.fromJson(json);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
