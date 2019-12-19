import 'package:flutter/material.dart';

@immutable
class CountdownTimer extends StatefulWidget {
  final TextStyle titleStyle = TextStyle(
    fontSize: 60,
    color: const Color(0xFFFFFFFF),
  );
  final TextStyle subtitleStyle = TextStyle(
    fontSize: 30,
    color: const Color(0xAAFFFFFF),
  );

  final int left, total;

  CountdownTimer({
    @required this.left,
    @required this.total,
  }) : assert(left <= total);

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
              '${this.widget.left} secs',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: this.widget.titleStyle,
            ),
          ),
          Center(
            child: Text(
              'left of your weekend',
              textDirection: TextDirection.ltr,
              style: this.widget.subtitleStyle,
            ),
          ),
        ],
      );
}
