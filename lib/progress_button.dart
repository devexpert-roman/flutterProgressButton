library progress_button;

import 'package:flutter/material.dart';

class AnimationButtonWidget extends StatelessWidget {
  final String text;
  final double value;
  final Size size;
  final TextStyle style;

  const AnimationButtonWidget(
      {super.key,
      required this.text,
      required this.value,
      required this.size,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      foregroundPainter: DownloadAnimationPainter(
          text: text, width: value * size.width, style: style),
    );
  }
}

class DownloadAnimationPainter extends CustomPainter {
  DownloadAnimationPainter(
      {required this.style, required this.text, required this.width});

  final String text;
  final double width;
  final TextStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    const color1 = Color.fromRGBO(28, 107, 194, 1);
    const color2 = Color.fromRGBO(209, 225, 242, 1);
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style //
            ))
      ..layout();

    final rectPaint1 = Paint()
      ..color = color2
      ..blendMode = BlendMode.src;

    final rectPaint3 = Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.src;

    final rectPaint = Paint()
      ..color = color1
      ..blendMode = BlendMode.difference;

    final rectPaint2 = Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.difference;

    canvas.drawRect(
        const Offset(0, 0) & Size(size.width, size.height), rectPaint1);
    canvas.drawRect(const Offset(0, 0) & Size(width, size.height), rectPaint3);
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - textPainter.width / 2,
            size.height / 2 - textPainter.height / 2));

    canvas.drawRect(const Offset(0, 0) & Size(width, size.height), rectPaint);

    canvas.drawRect(const Offset(0, 0) & Size(width, size.height), rectPaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
