import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Logos extends StatelessWidget {
  final double iconWidth;
  final double fontSize;
  final double spacing;
  final double topPadding;
  const Logos({
    super.key, required this.iconWidth, required this.fontSize, required this.spacing, required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/icons/camera-lens-ai-fill.svg",
          width: iconWidth,
        ),
        SizedBox(width: spacing),
        Padding(
          padding:  EdgeInsets.only(top: topPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "ptiNotes",
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: fontSize,
                  color: Color(0xffCEDBC0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}