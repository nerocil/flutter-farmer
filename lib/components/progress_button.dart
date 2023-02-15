import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final String name;
  final Function onPress;
  final bool loading;
  final Color? color;

  const ProgressButton(
      {Key? key,
        required this.name,
        required this.onPress,
        this.loading = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(44), primary: color??Theme.of(context).primaryColor),
      onPressed: loading
          ? null
          : () {
        onPress();
      },
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Visibility(
                    visible: loading,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}