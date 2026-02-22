import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AQIProvider extends ChangeNotifier {
  int? _aqi;
  bool _isLoading = false;
  Timer? _timer;
  double? _pm25;
  double? _temperature;

  int? get aqi => _aqi;
  bool get isLoading => _isLoading;
  double? get pm25 => _pm25;
  double? get temperature => _temperature;

  void startAutoFetch() {
    fetchAQI();  // เรียกครั้งแรกทันที

    _timer = Timer.periodic(const Duration(minutes: 5), (_) => fetchAQI());
  }

  Future<void> fetchAll() async {
  await fetchAQI();        // จาก Air4Thai
  await fetchTemperature(); // จาก Open-Meteo
}

  Future<void> fetchAQI() async {
    final url = Uri.parse(
      'http://www.air4thai.com/forweb/getAQI_JSON.php?province=กรุงเทพมหานคร',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final stations = data['stations'];

      if (stations != null && stations.isNotEmpty) {
        int totalAqi = 0;
        double totalPm25 = 0;


        int countAqi = 0;
        int countPm25 = 0;


        for (var station in stations) {
          final aqiValue = station['AQILast']?['AQI']?['aqi'];
          final pm25Value = station['AQILast']?['PM25']?['value'];
          

          if (aqiValue != null) {
            totalAqi += int.parse(aqiValue.toString());
            countAqi++;
          }

          if (pm25Value != null) {
            totalPm25 += double.parse(pm25Value.toString());
            countPm25++;
          }

          
        }

        final newAqi = countAqi > 0 ? (totalAqi / countAqi).round() : null;

        final newPm25 = countPm25 > 0 ? (totalPm25 / countPm25) : null;

        

        bool changed = false;

        if (_aqi != newAqi) {
          _aqi = newAqi;
          changed = true;
        }

        if (_pm25 != newPm25) {
          _pm25 = newPm25;
          changed = true;
        }

       

        if (changed) {
          notifyListeners();
        }
      }
    }
  }

  Future<void> fetchTemperature() async {
  final url = Uri.parse(
    'https://api.open-meteo.com/v1/forecast?latitude=13.7563&longitude=100.5018&current_weather=true',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final newTemp = data['current_weather']?['temperature'];

    if (newTemp != null) {
      final temp = double.parse(newTemp.toString());

      if (_temperature != temp) {
        _temperature = temp;
        notifyListeners();
      }
    }
  }
}

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
