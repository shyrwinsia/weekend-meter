import 'package:flutter/material.dart';

@immutable
class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    required this.left,
    required this.total,
  }) : assert(left <= total);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 60,
    color: Color(0xFFFFFFFF),
  );
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 30,
    color: Color(0xAAFFFFFF),
  );

  final int left, total;

  @override
  createState() => _CountdownTimer();
}

class _CountdownTimer extends State<CountdownTimer> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // change this to countdown timer widget
          Center(
            child: Text(
              '${widget.left} secs',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: CountdownTimer.titleStyle,
            ),
          ),
          Center(
            child: Text(
              'left of your weekend',
              textDirection: TextDirection.ltr,
              style: CountdownTimer.subtitleStyle,
            ),
          ),
        ],
      );
}
