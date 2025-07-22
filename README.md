
# Flutter Weather App

A simple cross-platform Flutter app that shows current weather and a 7-day forecast using the free WeatherAPI.com service.

---

## Features

- Display current weather details for a city:
  - Temperature (°C)
  - Weather condition description
  - Humidity percentage
  - Wind speed (kph)
- 7-day weather forecast with daily min/max temperatures and conditions.
- Search functionality to look up weather by city name.
- Simple, clean UI using Flutter and Provider for state management.

---

## Screenshots

![weatherapp](https://github.com/user-attachments/assets/2a5b3238-68db-49ad-9114-c86d4ee79cc0)

![search](https://github.com/user-attachments/assets/735a38ab-5093-4033-b64b-7558c9c8e4d1)


---
# Project Folder Structure
My folder structure is:
lib/
├── main.dart
├── core/
            ----config
            ----utils
            ----provider
            ----services
      
│   
├── feature/
             ---data/
                   ---model/
             ---presentaion
                  ---- screens/
                  ----widgets/

assets/
pubspec.yaml
README.md
lib/
├── main.dart
├── core/
│ ├── config/
│ ├── provider/
│ ├── services/
│ └── utils/
├── feature/
│ ├── data/
│ │ └── model/
│ └── presentation/
│ ├── screens/
│ └── widgets/
assets/
pubspec.yaml
README.md


## Android Apk

Link: https://drive.google.com/file/d/1j3iQf-GPEljUQWVT4vntNEKTWlQv0WdN/view?usp=sharing

## Setup Instructions

### Prerequisites

- Flutter SDK installed ([Flutter install guide](https://flutter.dev/docs/get-started/install))
- An IDE such as Android Studio.
- Internet connection for API calls

### Get WeatherAPI.com API Key (Free)

1. Sign up at [https://www.weatherapi.com](https://www.weatherapi.com)
2. Go to the dashboard and copy  API key.

### Configure the API Key

1. Open `lib/services/weather_service.dart`
2. Paste `apiKey: f01395384a2c48f69a065023252207` value with my WeatherAPI.com key:
# Limitations & Notes
-The free WeatherAPI.com plan supports up to 7-day forecasts.
-Location-based weather by GPS is not implemented — user searches city manually.
-No offline caching yet (can be added with SharedPreferences or SQLite).
-Error handling covers invalid city names and network issues.
-UI is simple and can be customized further.

# Dependencies
provider — State management
http — API requests
intl — Date formatting


# Github Commands
git commit -m "weatherapp"
git remote add origin https://github.com/HridoyDhar1/WeatherApp.git
git branch -M main
git push -u origin main
