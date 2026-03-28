import 'package:flutter/material.dart';

class ButtonLog extends StatelessWidget {
  final  String labelName ;
  final VoidCallback? onPressed;
  const ButtonLog({
    super.key, required this.labelName,this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ElevatedButton kamu
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3A8C8A),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              labelName,
              style: TextStyle(color: Colors.white70, letterSpacing: 2),
            ),
          ),
        ),

        // Bracket corners di atas button
        const Positioned(top: 8, left: 8,
            child: _BracketCorner(position: CornerPosition.topLeft)),
        const Positioned(top: 8, right: 8,
            child: _BracketCorner(position: CornerPosition.topRight)),
        const Positioned(bottom: 8, left: 8,
            child: _BracketCorner(position: CornerPosition.bottomLeft)),
        const Positioned(bottom: 8, right: 8,
            child: _BracketCorner(position: CornerPosition.bottomRight)),
      ],
    );
  }
}

enum CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

class _BracketCorner extends StatelessWidget {
  final CornerPosition position;

  const _BracketCorner({required this.position});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(8, 8),
      painter: _CornerPainter(position: position),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final CornerPosition position;

  _CornerPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final w = size.width;
    final h = size.height;

    switch (position) {
      case CornerPosition.topLeft:
        canvas.drawLine(Offset(0, h), Offset(0, 0), paint);
        canvas.drawLine(Offset(0, 0), Offset(w, 0), paint);
        break;
      case CornerPosition.topRight:
        canvas.drawLine(Offset(w, h), Offset(w, 0), paint);
        canvas.drawLine(Offset(w, 0), Offset(0, 0), paint);
        break;
      case CornerPosition.bottomLeft:
        canvas.drawLine(Offset(0, 0), Offset(0, h), paint);
        canvas.drawLine(Offset(0, h), Offset(w, h), paint);
        break;
      case CornerPosition.bottomRight:
        canvas.drawLine(Offset(w, 0), Offset(w, h), paint);
        canvas.drawLine(Offset(w, h), Offset(0, h), paint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}