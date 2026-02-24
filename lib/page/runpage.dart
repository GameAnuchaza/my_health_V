import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_health/fun/AQIProvider.dart';
import 'package:my_health/fun/Hiveset.dart';
import 'package:provider/provider.dart';

class Runpage extends StatefulWidget {
  const Runpage({super.key});

  @override
  State<Runpage> createState() => _RunpageState();
}

class _RunpageState extends State<Runpage> {
  Timer? _timer;
  int? aqi;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(minutes: 1), (timer) {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String runningAdvice(int aqi) {
    if (aqi <= 25) {
      return "วิ่งได้ 45–90 นาที 🟢";
    } else if (aqi <= 50) {
      return "วิ่งได้ 30–60 นาที 🟢";
    } else if (aqi <= 100) {
      return "วิ่งได้ 20–40 นาที 🟡";
    } else if (aqi <= 150) {
      return "วิ่งได้ 10–20 นาที 🟠";
    } else if (aqi <= 200) {
      return "ไม่ควรวิ่งนานกว่า 10 นาที 🔴";
    } else {
      return "ไม่ควรวิ่งกลางแจ้ง ❌";
    }
  }

  String getPm25Level(double? value) {
    if (value == null) return "ไม่พบค่าฝุ่น";

    if (value >= 38) return "เริ่มอันตราย";
    if (value >= 16) return "ปานกลาง";
    if (value >= 0) return "ดี";

    return "ไม่พบค่าฝุ่น";
  }

  Color getTemperatureColor(double? temp) {
    if (temp == null) return Colors.grey;

    if (temp >= 36) return const Color.fromRGBO(244, 67, 54, 0.6);
    if (temp >= 30) return const Color.fromRGBO(255, 152, 0, 0.6);
    if (temp >= 20) return const Color.fromARGB(255, 0, 190, 6);
    return Colors.blue;
  }

  String getTemperatureLevel(double? temp) {
    if (temp == null) return "ไม่ทราบค่า";

    if (temp >= 36) return "ร้อนจัด";
    if (temp >= 30) return "ร้อน";
    if (temp >= 20) return "ปกติ";
    return "เย็น";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(1, 213, 236, 1),
                        Color.fromRGBO(1, 213, 236, 1),
                      ],
                    ),
                    border: Border.all(color: Color.fromRGBO(1, 213, 236, 1)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),

                  alignment: Alignment.center,
                  child: Consumer<SettingsProvider>(
                    builder: (context, settings, child) {
                      return Text(
                        settings.province,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 170, 255, 9),
                        Color.fromRGBO(0, 170, 255, 9),
                      ],
                    ),
                    border: Border.all(color: Color.fromRGBO(0, 170, 255, 0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,

                  child: Consumer<AQIProvider>(
                    builder: (context, provider, child) {
                      final aqi = provider.aqi;

                      if (aqi == null) {
                        return const Text(
                          "Loading...",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        );
                      }

                      return Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "คุณภาพอากาศ $aqi",
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            runningAdvice(aqi),
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 30,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  alignment: Alignment.center,
                  child: Consumer<AQIProvider>(
                    builder: (context, provider, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: getTemperatureColor(
                                  provider.temperature,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    0.3,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),

                              child: Column(
                                children: [
                                  SizedBox(height: 45),
                                  Text(
                                    "อุหภูมิ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),

                                  Text(
                                    provider.temperature!.toStringAsFixed(0) +
                                        "°C",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    getTemperatureLevel(provider.temperature),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: (provider.temperature ?? 0) >= 25.0
                                    ? Colors.red
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    0.3,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),

                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    "PM2.5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    provider.pm25!.toStringAsFixed(2) +
                                        " µg/m³",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    getPm25Level(provider.pm25),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
