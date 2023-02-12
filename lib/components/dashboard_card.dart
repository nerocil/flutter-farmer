import 'package:flutter/material.dart';
class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String total;
  final String subtotal;
  const DashboardCard({Key? key, required this.title, required this.subtitle, required this.total, required this.subtotal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints(maxWidth: 300,),
      //height: 120,
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme
                    .of(context)
                    .textTheme
                    .caption
                    ?.color),
              ),
              Row(
                children: [
                  Text(total,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Chip(backgroundColor: Colors.green[100],
                    label: Text("$subtotal%",
                      style: TextStyle(color: Colors.green[600]),),
                    avatar: Icon(
                      Icons.show_chart, color: Colors.green[600],),)
                ],
              ),
              Text(title,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),
      ),);
  }
}
