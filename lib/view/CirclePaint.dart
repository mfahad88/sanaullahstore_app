
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CirclePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint=Paint()
      ..color=Colors.white
        ..style=PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), 50, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }



}