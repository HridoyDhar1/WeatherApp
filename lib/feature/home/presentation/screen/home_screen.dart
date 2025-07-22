import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/weather_provider.dart';
import '../wigets/weather_detatils.dart';
import 'search_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final defaultCity = "Dhaka";

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    provider.fetchWeatherByCity(defaultCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()));
              }),
        ],
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.error != null) {
            return Center(child: Text(provider.error!));
          } else if (provider.weather == null) {
            return const Center(child: Text('No data'));
          }

          return WeatherDetails(provider: provider);
        },
      ),

    );
  }
}
