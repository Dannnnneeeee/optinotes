import 'package:flutter/material.dart';

import '../models/activity_model.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.012),
          child: Row(
            children: [
              CircleAvatar(
                radius: w * 0.055,
                backgroundColor: Colors.grey.shade100,
                child: Text(activity.emoji, style: TextStyle(fontSize: 20)),
              ),
              SizedBox(width: w * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2),
                    Text(
                      activity.date,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                activity.amount,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey.shade200, thickness: 0.5),
      ],
    );
  }
}