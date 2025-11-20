import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weekendmeter/meter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const WeekendMeterApp());
}

@immutable
class WeekendMeterApp extends StatelessWidget {
  const WeekendMeterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekend Meter',
      theme: ThemeData(
        fontFamily: 'Simplifica',
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Color(0xEE000000),
        body: WeekendMeter(),
      ),
    );
  }
}
