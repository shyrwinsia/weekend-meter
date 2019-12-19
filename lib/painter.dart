import 'dart:math';

import 'package:flutter/material.dart';

@immutable
class WavePainter extends CustomPainter {
  final List<Wave> waves = List();

  WavePainter({@required height, @required phase}) {
    waves
      ..add(Wave(
          height: height,
          frequency: 0.09,
          amplitude: 8,
          phase: phase + 130,
          gradient: LinearGradient(colors: [
            const Color(0xFFF37335),
            const Color(0x88F37335),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)))
      ..add(Wave(
          height: height,
          frequency: 0.03,
          amplitude: 6,
          phase: phase + 250,
          gradient: LinearGradient(colors: [
            const Color(0xFFF37335),
            const Color(0xAAFED561),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)))
      ..add(Wave(
          height: height,
          frequency: 0.6,
          amplitude: 4,
          phase: phase,
          gradient: LinearGradient(colors: [
            const Color(0xFFF37335),
            const Color(0xFFFDC830),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)));
  }

  @override
  void paint(Canvas canvas, Size size) {
    // we go through the stack of waves
    for (Wave wave in this.waves) {
      Path path = Path();
      Paint paint = Paint();

      // move to the lefmost part of the screen to start painting
      path.moveTo(
          0,
          _sin(
            0,
            wave.height,
            size.width,
            wave.frequency,
            wave.amplitude,
            wave.phase,
          ));

      // draw the sine wave from there, f(x) = sin(x)
      for (double x = 1; x < size.width; x++) {
        double y = _sin(
          x,
          wave.height,
          size.width,
          wave.frequency,
          wave.amplitude,
          wave.phase,
        );
        // draw the line
        path.lineTo(x, y);
      }

      // go down and right
      path.lineTo(size.width, wave.height);
      // go left and up to close the shape
      path.lineTo(0, wave.height);
      // apply the gradient as a shader
      paint.shader = wave.gradient.createShader(
        Offset.zero & Size(size.width, -wave.height),
      );
      // paint it to the canvas
      canvas.drawPath(path, paint);
    }
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

// The data model class that will hold the wave attributes
class Wave {
  final double height;
  final double phase;
  final double frequency;
  final double amplitude;
  final Gradient gradient;

  Wave({
    @required this.height,
    @required this.frequency,
    @required this.amplitude,
    @required this.phase,
    @required this.gradient,
  });
}
