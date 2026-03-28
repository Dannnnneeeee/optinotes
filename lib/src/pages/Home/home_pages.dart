import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';
import '../../../widgets/activity_items.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_icons.dart';

class HomePage extends StatelessWidget {
  final List<ActivityModel> activities = [
    ActivityModel(emoji: "🍔", title: "Burger Town", date: "11 Oct, 2025", amount: "\$19.60"),
    ActivityModel(emoji: "🍣", title: "Sushi Corner", date: "10 Oct, 2025", amount: "\$34.25"),
    ActivityModel(emoji: "☕", title: "Blue Bottle Café", date: "09 Oct, 2025", amount: "\$12.00"),
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: h * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Jembuy"),
                          SizedBox(height: h * 0.016),
                          Text("bingciling"),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: w*0.90,
                  margin: EdgeInsets.symmetric(vertical: h * 0.011),
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05,
                    vertical: h * 0.025,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(w * 0.05), // radius juga responsive
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tabungan gweh",style: TextStyle(fontSize: 16)),
                          SizedBox(height: h*0.012),
                          Text("Rp.10.000.000",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      Divider(  // ← garis pembagi
                        color: Colors.grey.shade200,
                        thickness: 1,
                        indent: w * 0.05,      // jarak dari kiri
                        endIndent: w * 0.05,   // jarak dari kanan
                      ),
                      SizedBox(height: h * 0.032,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomIcons(iconsData: Icon(Icons.add), labelIcons: 'Create New'),
                          CustomIcons(iconsData: Icon(Icons.call_made_rounded), labelIcons: 'Share'),
                          CustomIcons(iconsData: Icon(Icons.history), labelIcons: 'History'),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payments),
                            Text("Bill")
                          ],
                        ),
                        TextButton(onPressed: (){}, child: Text("Lihat semua"))
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8,
                        children: [
                          BillCard(
                            emoji: "🌮",
                            title: "Dinner at Taco Bar",
                            date: "Oct 21, 2025",
                            amount: "Rp.110.000",
                            totalPeople: 5,
                          ),BillCard(
                            emoji: "🌮",
                            title: "Dinner at Taco Bar",
                            date: "Oct 21, 2025",
                            amount: "\$117.00",
                            totalPeople: 5,
                          ),BillCard(
                            emoji: "🌮",
                            title: "Dinner at Taco Bar",
                            date: "Oct 21, 2025",
                            amount: "\$117.00",
                            totalPeople: 5,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Activity", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            TextButton(onPressed: () {}, child: Text("View all")),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: activities.length,
                          itemBuilder: (context, index) => ActivityItem(
                            activity: activities[index],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





