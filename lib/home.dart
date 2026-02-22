import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 10, child: context.watch<Conwidet>().currentwidet),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 8),
                    color: Colors.black,
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.read<Conwidet>().goToWidet(0);
                      },
                      child: Container(
                        child: Column(children: [Icon(Icons.home, size: 50)]),
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.read<Conwidet>().goToWidet(1);
                      },
                      child: Container(
                        child: Column(
                          children: [Icon(Icons.directions_run, size: 50)],
                        ),
                      ),
                    ),
                  ),

                   Expanded(
                    child: InkWell(
                      onTap: () {
                        context.read<Conwidet>().goToWidet(2);
                      },
                      child: Container(
                        child: Column(
                          children: [Icon(Icons.account_circle, size: 50)],
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
