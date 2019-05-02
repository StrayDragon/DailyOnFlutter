import 'package:flutter/material.dart';
import 'dart:math' as math;

class CountDownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CountDownWidgetState();
}

class CountDownWidgetState extends State<CountDownWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  String get timeString {
    Duration duration = _controller.duration * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                animation: _controller,
                                backgroundColor: Colors.white,
                                color: Colors.pink,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("开始计时"),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget child) {
                      return Text(
                        timeString,
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget child) {
                        return Icon(
                          _controller.isAnimating
                              ? Icons.pause
                              : Icons.play_arrow,
                        );
                      },
                    ),
                    onPressed: () {
                      if (_controller.isAnimating)
                        _controller.stop();
                      else {
                        _controller.reverse(
                            from: _controller.value == 0.0
                                ? 1.0
                                : _controller.value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) =>
      animation.value != old.animation.value ||
      color != old.color ||
      backgroundColor != old.backgroundColor;
}
