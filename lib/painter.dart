import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double phase;
  final double amplitude;
  final double frequency;
  final double height;

  WavePainter({
    @required this.amplitude,
    @required this.phase,
    @required this.frequency,
    @required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path wave1 = Path();
    Path wave2 = Path();
    Path wave3 = Path();
    Paint paint1 = Paint();
    Paint paint2 = Paint();
    Paint paint3 = Paint();

    // move to x, y start
    wave1.moveTo(
        0,
        _sin(
          0,
          height,
          size.width,
          this.frequency,
          this.amplitude,
          this.phase,
        ));

    wave2.moveTo(
        0,
        _sin(
          0,
          height,
          size.width,
          this.frequency / 3,
          this.amplitude * 1.2,
          this.phase + 230,
        ));

    wave3.moveTo(
        0,
        _sin(
          0,
          height,
          size.width,
          this.frequency / 7,
          this.amplitude * 1.8,
          this.phase + 130,
        ));

    // draw the sine wave from there
    for (double x = 1; x < size.width; x++) {
      double y1 = _sin(
        x,
        height,
        size.width,
        this.frequency,
        this.amplitude,
        this.phase,
      );

      double y2 = _sin(
        x,
        height,
        size.width,
        this.frequency / 3,
        this.amplitude * 1.2,
        this.phase + 230,
      );

      double y3 = _sin(
        x,
        height,
        size.width,
        this.frequency / 7,
        this.amplitude * 1.8,
        this.phase + 130,
      );

      wave1.lineTo(x, y1);
      wave2.lineTo(x, y2);
      wave3.lineTo(x, y3);
    }

    wave1.lineTo(size.width, height);
    wave1.lineTo(0, height);

    wave2.lineTo(size.width, height);
    wave2.lineTo(0, height);

    wave3.lineTo(size.width, height);
    wave3.lineTo(0, height);

    var rect = Offset.zero & Size(size.width, -height);

    paint1.shader = LinearGradient(colors: [
      const Color(0xFFF37335),
      const Color(0xFFFDC830),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .createShader(rect);

    paint2.shader = LinearGradient(colors: [
      const Color(0xFF000000),
      const Color(0xAAFFD561),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .createShader(rect);

    paint3.shader = LinearGradient(colors: [
      const Color(0xFF000000),
      const Color(0xAAF37335),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .createShader(rect);

    canvas.drawPath(wave3, paint3);
    canvas.drawPath(wave2, paint2);
    canvas.drawPath(wave1, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double _sin(
    double x,
    double height,
    double width,
    double frequency,
    double amplitude,
    double phase,
  ) {
    // convert to radians because the function can only accept radians
    double angleRadians = ((2 * pi * frequency) / width) * x;
    double phaseRadians = (2 * pi / 360.0) * phase;
    return (sin(angleRadians + phaseRadians) * amplitude) - height;
  }
}
