import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_health/fun/AQIProvider.dart';
import 'package:my_health/fun/Hiveset.dart';
import 'package:my_health/fun/conpage.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConPage()),
        ChangeNotifierProvider(create: (_) => Conwidet()),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider()..loadSettings(),
        ),
        ChangeNotifierProxyProvider<SettingsProvider, AQIProvider>(
          create: (_) => AQIProvider(),
          update: (context, settings, aqiProvider) {
            final provider = aqiProvider ?? AQIProvider();

            provider.startAutoFetch(settings.province);

            return provider;
          },
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
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
    return Scaffold(body: context.watch<ConPage>().currentPage);
  }
}
