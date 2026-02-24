import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class IFconpage extends StatefulWidget {
  const IFconpage({super.key});

  @override
  State<IFconpage> createState() => _IFconpageState();
}

class _IFconpageState extends State<IFconpage> {
  TimeOfDay? startEat;
  int fastingHours = 16;
  int eatingHours = 8;

  Timer? timer;

  bool isEating = false;
  DateTime? endEatTime;
  DateTime? nextEatTime;

  @override
  void initState() {
    super.initState();

    // อัปเดตทุก 1 นาที
    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (startEat != null) {
        calculateIF();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> pickStartTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        startEat = time;
      });

      calculateIF();
    }
  }

  void calculateIF() {
    DateTime now = DateTime.now();

    DateTime start = DateTime(
      now.year,
      now.month,
      now.day,
      startEat!.hour,
      startEat!.minute,
    );

    DateTime endEat = start.add(Duration(hours: eatingHours));

    if (now.isAfter(endEat)) {
      start = start.add(const Duration(days: 1));
      endEat = start.add(Duration(hours: eatingHours));
    }

    bool eating = now.isAfter(start) && now.isBefore(endEat);

    setState(() {
      isEating = eating;
      endEatTime = endEat;
      nextEatTime = eating ? null : start;
    });
  }

  String formatTime(DateTime? time) {
    if (time == null) return "-";
    return TimeOfDay.fromDateTime(time).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.read<Conwidet>().goToWidet(0);
                  },
                  icon: Icon(Icons.arrow_back, size: 40),
                ),
              ),

              Text("Intermittent Fasting (IF)", style: TextStyle(fontSize: 30)),
              

              Padding(padding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: pickStartTime,
                      child: const Text("เลือกเวลาเริ่มกิน"),
                    ),

                    const SizedBox(height: 20),

                    if (startEat != null)
                      Text(
                        "เริ่มกินเวลา ${startEat!.format(context)}",
                        style: const TextStyle(fontSize: 18),
                      ),

                    const SizedBox(height: 30),

                    if (startEat != null) ...[
                      Text(
                        isEating ? "🍽 ตอนนี้กินได้" : "🔥 ตอนนี้ห้ามกิน",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isEating ? Colors.green : Colors.red,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "กินได้ถึง: ${formatTime(endEatTime)}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 10),

                      if (!isEating)
                        Text(
                          "จะกินได้อีกที: ${formatTime(nextEatTime)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                    ],
                  ],
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
