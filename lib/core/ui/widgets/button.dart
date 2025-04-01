import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const Button({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child);
  }
}
