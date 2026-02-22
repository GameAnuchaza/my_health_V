import 'package:flutter/material.dart';
import 'package:my_health/fun/conpage.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ConPage()),
        ChangeNotifierProvider(create: (_)=> Conwidet())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _navigated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _navigated) return;

      _navigated = true;

      context.read<ConPage>().goToPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ConPage>().currentPage,
    );
  }
}
