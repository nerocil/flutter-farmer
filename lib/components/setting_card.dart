import 'package:flutter/material.dart';
class SettingCard extends StatelessWidget {
  final String title;
  final Widget content;
  const SettingCard({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2,),
        const SizedBox(height: 5),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: content,
        ),
      ],
    );
  }
}
