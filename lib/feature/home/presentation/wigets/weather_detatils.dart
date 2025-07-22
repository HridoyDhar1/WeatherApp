import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/provider/weather_provider.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherProvider provider;

  const WeatherDetails({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final weather = provider.weather!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weather.city, style: const TextStyle(fontSize: 24)),
          Text('${weather.temperature}°C - ${weather.conditionText}'),
          Text('Humidity: ${weather.humidity}%'),
          Text('Wind Speed: ${weather.windKph} kph'),
          const SizedBox(height: 16),
          const Text('7-Day Forecast', style: TextStyle(fontSize: 18)),
          Expanded(
            child: ListView.builder(
              itemCount: weather.forecast.length,
              itemBuilder: (context, index) {
                final day = weather.forecast[index];
                return ListTile(
                  title: Text(DateFormat('EEE, MMM d').format(day.date)),
                  subtitle: Text(day.conditionText),
                  trailing: Text('${day.minTemp}°C / ${day.maxTemp}°C'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
