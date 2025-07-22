import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  void _search() {
    if (_controller.text.trim().isEmpty) return;
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    provider.fetchWeatherByCity(_controller.text.trim()).then((_) {
      if (provider.error == null) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Search City')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'City name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _search, child: const Text('Search')),
            if (provider.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(provider.error!,
                    style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
