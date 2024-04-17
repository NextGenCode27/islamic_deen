import 'dart:math';

import 'package:flutter/material.dart';

class SunProgressBarPainter extends CustomPainter {
  final double progress;

  SunProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    const double strokeWidth = 8;
    const double arcAngle = pi; // Half circle (180 degrees)

    // Draw background arc
    Paint bgPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(radius, radius), radius: radius - strokeWidth / 2),
      -pi / 1, // Start angle (90 degrees)
      arcAngle,
      false,
      bgPaint,
    );

    // Draw progress arc
    Paint progressPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(radius, radius), radius: radius - strokeWidth / 2),
      -pi / 1, // Start angle (90 degrees)
      arcAngle * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
