import 'package:flutter/material.dart';
class ActiveStatus extends StatelessWidget {
  final bool isActive;
  const ActiveStatus({
    Key? key, required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive ? Chip(
      // labelPadding: EdgeInsets.all(0),
      label: Text(
        'Active',
        style: Theme.of(context)
            .textTheme
            .caption?.copyWith(color: Colors.green[800]),
      ),
      backgroundColor: Colors.green[50],
    ): Chip(
      // labelPadding: EdgeInsets.all(0),
      label: Text(
        'InActive',
        style: Theme.of(context)
            .textTheme
            .caption?.copyWith(color: Colors.red[800]),
      ),
      backgroundColor: Colors.red[50],
    );
  }
}