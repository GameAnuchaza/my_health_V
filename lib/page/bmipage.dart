import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Bmipage extends StatefulWidget {
  const Bmipage({super.key});

  @override
  State<Bmipage> createState() => _BmipageState();
}

class _BmipageState extends State<Bmipage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double? bmi;

  void calculateBMI() {
    final weight = double.tryParse(weightController.text);
    final heightCm = double.tryParse(heightController.text);

    if (weight != null && heightCm != null && heightCm > 0) {
      final heightMeter = heightCm / 100;
      final result = weight / (heightMeter * heightMeter);

      setState(() {
        bmi = result;
      });
    }
  }

  String getBMICategory(double value) {
    if (value < 18.5) return "ผอม";
    if (value < 23) return "ปกติ";
    if (value < 25) return "น้ำหนักเกิน";
    if (value < 30) return "อ้วน";
    return "อ้วนมาก";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.read<Conwidet>().goToWidet(0);
                  },
                  icon: Icon(Icons.arrow_back, size: 40),
                ),
              ),
              Text('คำนวณหาค่าดัชนีมวลกาย', style: TextStyle(fontSize: 30)),
              Text('(MBI)', style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 500,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'น้ำหนัก (กก.)',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ส่วนสูง (ซม.)',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: calculateBMI,
                        child: Text("คำนวณ BMI"),
                      ),

                      SizedBox(height: 40),

                      if (bmi != null)
                        Column(
                          children: [
                            Text(
                              "BMI: ${bmi!.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "ระดับ: ${getBMICategory(bmi!)}",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                    ],
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
