import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),

                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.all(20),

                    child: Text(
                      "ดูแลสุขภาพกันเถอะ ❤️",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),

                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 130,
                  child: Padding(
                    padding: EdgeInsets.all(20),

                    child: Row(
                      children: [
                        Column(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                context.read<Conwidet>().goToWidet(3);
                              },
                              icon: Icon(
                                Icons.calculate,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            Text("BMI", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),

                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 520,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "ข่าวสารสุขภาพ",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            context.read<Conwidet>().goToWidet(4);
                            print(55);
                          },
                          child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(158, 158, 158, 1),
                                blurRadius: 10,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/Triglyceride.jpg",
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("เปิด 5 วิธีช่วยลดหากไตรกลีเซอไรด์เกิน 200 ",style: TextStyle(
                                fontSize: 16
                              ),)
                            ],
                          ),
                        ),
                        ),
                        SizedBox(height: 20),  
                        
                      ],
                    ),
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
