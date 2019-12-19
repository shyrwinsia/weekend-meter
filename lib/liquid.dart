import 'package:flutter/material.dart';
import 'package:weekendmeter/painter.dart';

@immutable
class Liquid extends StatefulWidget {
  final int left, total;

  Liquid({
    @required this.left,
    @required this.total,
  }) : assert(left <= total);

  @override
  createState() => _LiquidState();
}

class _LiquidState extends State<Liquid> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  double phase = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 6000),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.forward(from: 0);
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..addListener(() => setState(() {
            phase = _animation.value;
          }));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => Align(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: WavePainter(
              height: (this.widget.left * MediaQuery.of(context).size.height) /
                  widget.total,
              phase: this._animation.value,
            ),
          ),
        ),
        alignment: Alignment.bottomCenter,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
