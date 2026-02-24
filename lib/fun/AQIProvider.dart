import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AQIProvider extends ChangeNotifier {
  int? _aqi;
  double? _pm25;
  double? _temperature;
  bool _isLoading = false;

  Timer? _timer;

  int? get aqi => _aqi;
  double? get pm25 => _pm25;
  double? get temperature => _temperature;
  bool get isLoading => _isLoading;

  final baseUrl = dotenv.env['WEATHER_BASE_URL'];

  // 🔥 เริ่ม auto fetch โดยรับ province
  void startAutoFetch(String province) {
  _timer?.cancel(); // 🔥 ต้อง cancel ก่อน

  fetchAll(province); // โหลดใหม่ทันที

  _timer = Timer.periodic(
    const Duration(minutes: 5),
    (_) => fetchAll(province),
  );
}

  Future<void> fetchAll(String province) async {
    await fetchAQI(province);
    await fetchTemperature();
  }

  Future<void> fetchAQI(String province) async {
    final url = Uri.http(
      'www.air4thai.com',
      '/forweb/getAQI_JSON.php',
      {'province': province},
    );

    final response = await http.get(url);

    if (response.statusCode != 200) return;

    final data = jsonDecode(response.body);
    final stations = data['stations'];

    if (stations == null || stations.isEmpty) return;

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

    if (changed) notifyListeners();
  }

  Future<void> fetchTemperature() async {

    final url = Uri.parse(
      "$baseUrl",
    );

    final response = await http.get(url);

    if (response.statusCode != 200) return;

    final data = jsonDecode(response.body);
    final newTemp = data['current_weather']?['temperature'];

    if (newTemp == null) return;

    final temp = double.parse(newTemp.toString());

    if (_temperature != temp) {
      _temperature = temp;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}