import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget mobileScaffoldLayout;
  final Widget tabletScaffoldLayout;
  final Widget desktopScaffoldLayout;

  const AppLayout(
      {Key? key,
      required this.mobileScaffoldLayout,
      required this.tabletScaffoldLayout,
      required this.desktopScaffoldLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScaffoldLayout;
      } else if (constraints.maxWidth < 1100) {
        return tabletScaffoldLayout;
      } else {
        return desktopScaffoldLayout;
      }
    });
  }
}
