import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weekendmeter/liquid.dart';
import 'package:weekendmeter/timer.dart';
import 'package:weekendmeter/weekend.dart';

@immutable
class WeekendMeter extends StatefulWidget {
  const WeekendMeter({super.key});

  static const Color background = Color(0xEE000000);

  @override
  State<WeekendMeter> createState() => _WeekendMeterState();
}

class _WeekendMeterState extends State<WeekendMeter> {
  Timer? _timer;
  int _left = 190800;
  int _total = 190800;
  bool _isWeekend = false;
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(() => (_left < 1) ? _stopTimer() : _left--),
    );
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isWeekend = false;
    });
  }

  void _initializeTimer() {
    if (WeekendUtility.isItWeekendAlready()) {
      setState(() {
        _isWeekend = true;
        _left = WeekendUtility.getSecondsToEndOfWeekend();
      });
      // start the timer
      _startTimer();
    }

    setState(() {
      _isInitializing = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _weekend() => Container(
        color: WeekendMeter.background,
        child: Stack(
          children: <Widget>[
            Liquid(
              left: _left,
              total: _total,
            ),
            CountdownTimer(
              left: _left,
              total: _total,
            ),
          ],
        ),
      );

  Widget _notWeekend() => const Center(
        child: Text(
          'It\'s not yet the weekend.\nGet back to work.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            color: Color(0xFFFFFFFF),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => _isInitializing
      ? const SizedBox()
      : _isWeekend
          ? _weekend()
          : _notWeekend();
}
