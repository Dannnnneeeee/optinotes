import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String date;
  final String amount;
  final int totalPeople;

  const BillCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.date,
    required this.amount,
    required this.totalPeople,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      width: w * 0.72,
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: w * 0.045,
                backgroundColor: Colors.grey.shade100,
                child: Text(emoji, style: TextStyle(fontSize: 16)),
              ),
              SizedBox(width: w * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          Divider(color: Colors.grey.shade200, thickness: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarStack(totalPeople: totalPeople),
              Text(amount, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarStack extends StatelessWidget {
  final int totalPeople;

  const AvatarStack({super.key, required this.totalPeople});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.purple.shade100,
      Colors.orange.shade100,
      Colors.blue.shade100,
    ];

    return Row(
      children: [
        ...List.generate(3, (index) =>
            Transform.translate(
              offset: Offset(index * -8.0, 0),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: colors[index],
              ),
            ),
        ),
        SizedBox(width: 4),
        Text("$totalPeople+", style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}