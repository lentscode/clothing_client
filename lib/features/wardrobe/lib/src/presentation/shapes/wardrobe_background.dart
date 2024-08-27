import "package:flutter/material.dart";

class WardrobeBackground extends CustomPainter {
  const WardrobeBackground(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint paint = Paint()..color = color;

    final Path path = Path()
      ..moveTo(0, height * .4)
      ..quadraticBezierTo(width * .25, height * .3, width * .5, height * .4)
      ..quadraticBezierTo(width * .75, height * .5, width, height * .4)
      ..lineTo(width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
