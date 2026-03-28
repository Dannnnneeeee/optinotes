import 'package:flutter/material.dart';
class CustomIcons extends StatelessWidget {
  final Icon iconsData ;
  final String? labelIcons;
  const CustomIcons({
    super.key, required this.iconsData, this.labelIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: iconsData,color: Color(0xFF3A8C8A),),
        Text(labelIcons ?? ''),
      ],
    );
  }
}
