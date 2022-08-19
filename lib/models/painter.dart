import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double width;
  final int height;
  final int index;

  MyPainter({
    required this.width,
    required this.height,
    required this.index,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.white70;
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.square;

    canvas.drawLine(
      Offset(index * width, 0),
      Offset(index * width, (height * 4).ceilToDouble()),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
