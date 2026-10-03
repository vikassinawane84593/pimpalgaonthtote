import 'package:flutter/material.dart';

class WeatherModel {
  final double temperature;
  final IconData icon;
  final String weatherText;
  final String greeting;

  WeatherModel({
    required this.temperature,
    required this.icon,
    required this.weatherText,
    required this.greeting,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0]['main'];

    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      icon: getWeatherIcon(weather),
      weatherText: getWeatherText(weather),
      greeting: getGreeting(),
    );
  }

  // ---------------- GREETING ----------------

  static String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'शुभ सकाळ';
    } else if (hour >= 12 && hour < 17) {
      return 'शुभ दुपार';
    } else if (hour >= 17 && hour < 21) {
      return 'शुभ संध्याकाळ';
    } else {
      return 'शुभ रात्री';
    }
  }

  // ---------------- WEATHER ICON ----------------

  static IconData getWeatherIcon(String weather) {
    switch (weather) {
      case 'Clear':
        return Icons.wb_sunny;

      case 'Clouds':
        return Icons.cloud;

      case 'Rain':
        return Icons.water_drop;

      case 'Drizzle':
        return Icons.grain;

      case 'Thunderstorm':
        return Icons.thunderstorm;

      case 'Snow':
        return Icons.ac_unit;

      case 'Mist':
      case 'Fog':
      case 'Haze':
        return Icons.foggy;

      default:
        return Icons.cloud;
    }
  }

  // ---------------- WEATHER TEXT ----------------

  static String getWeatherText(String weather) {
    switch (weather) {
      case 'Clear':
        return 'स्वच्छ आकाश';

      case 'Clouds':
        return 'ढगाळ वातावरण';

      case 'Rain':
        return 'पाऊस';

      case 'Drizzle':
        return 'रिमझिम पाऊस';

      case 'Thunderstorm':
        return 'वादळी पाऊस';

      case 'Snow':
        return 'बर्फवृष्टी';

      case 'Mist':
      case 'Fog':
      case 'Haze':
        return 'धुके';

      default:
        return 'हवामानाची माहिती उपलब्ध नाही';
    }
  }
}