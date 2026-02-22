import 'package:flutter/material.dart';
import 'package:my_health/fun/AQIProvider.dart';
import 'package:my_health/fun/conpage.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 🔥 Animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    // 🔥 โหลดข้อมูล
    _loadApp();
  }

  Future<void> _loadApp() async {
    try {
      await context.read<AQIProvider>().fetchAll(); // รอ API เสร็จจริง

      if (!mounted) return;

      await Future.delayed(const Duration(seconds: 1));

      context.read<ConPage>().goToPage(1);
    } catch (e) {
      print("โหลดข้อมูลผิดพลาด: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icon/app_icon.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "My Health",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}