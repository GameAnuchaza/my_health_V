import 'package:flutter/material.dart';
import 'package:my_health/fun/AQIProvider.dart';
import 'package:my_health/fun/conpage.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<AQIProvider>().fetchAll(); 
        await Future.delayed(const Duration(seconds: 2));

        context.read<ConPage>().goToPage(1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}