import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weekendmeter/meter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(WeekendMeterApp());
}

class WeekendMeterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekend Meter',
      theme: ThemeData(
        fontFamily: 'Simplifica',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xEE000000),
        body: WeekendMeter(),
      ),
    );
  }
}
