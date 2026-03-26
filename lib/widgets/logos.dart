import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Logos extends StatelessWidget {
  const Logos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/icons/camera-lens-ai-fill.svg",
          width: 88,
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ptiNotes",
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 48,
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