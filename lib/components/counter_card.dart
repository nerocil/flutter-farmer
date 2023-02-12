import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String total;
  final String title;

  const CounterCard({Key? key, required this.total, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme
            .of(context)
            .textTheme
            .caption
            ?.copyWith(fontWeight: FontWeight.bold),),
        Text(total, style: Theme
            .of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
