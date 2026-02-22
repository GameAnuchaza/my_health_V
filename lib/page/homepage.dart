import 'dart:ui';

import 'package:flutter/material.dart';

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
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                
                  
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(83, 245, 199, 0.3),
                           Color.fromRGBO(83, 245, 199, 0.3), 
                           Color.fromRGBO(34, 168, 168, 0.3),
                        ],
                      ),
                      border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.3)),
                     boxShadow: [
  BoxShadow(
    color: const Color.fromRGBO(255, 255, 255, 0.1),
    blurRadius: 20,
    offset: Offset(0, 10),
  ),
],
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      
                      child: Text(
                        "ดูแลสุขภาพกันเถอะ ❤️",
                        style: TextStyle(color: Colors.white ,fontSize: 30),
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
