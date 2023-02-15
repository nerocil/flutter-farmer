import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final Widget leading;
  final Text title;
  final EdgeInsetsGeometry? margin;
  final Text? subtitle;
  final IconData? actionLeading;
  final Function()? onTap;

  const SettingItem({
    Key? key,
    required this.leading,
    required this.title,
    this.margin,
    this.subtitle,
    this.actionLeading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 64,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 16,
            bottom: 0,
            left: 24,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).cardColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            title,
                            subtitle ?? const SizedBox(),
                          ],
                        ),
                      ),
                      actionLeading != null ? Icon(actionLeading) : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 5,
            child: Center(
              child: Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3),
                  color: Theme.of(context).cardColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: leading,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
