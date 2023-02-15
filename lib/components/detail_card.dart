import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Widget body;
  final String backgroundImage;
  final double marginBottom;
  final Widget? action;
  final Widget? footer;

  const DetailCard(
      {Key? key,
      required this.title,
      required this.body,
      this.marginBottom = 20,
      this.backgroundImage = '',
      this.action,
      this.titleColor,
      this.footer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color:titleColor??Theme.of(context).textTheme.titleMedium?.color ),
                ),
                action ?? const SizedBox(),
              ],
            ),
            const SizedBox(height: 8),
            body,
            footer != null ? Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Theme.of(context).cardColor),
              child: footer,
            ): const SizedBox()
          ],
        ),
      ),
    );
  }
}
