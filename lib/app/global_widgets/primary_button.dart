import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double radius;
  final void Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.backgroundColor = const Color.fromRGBO(16, 75, 191, 1),
    this.borderColor,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(300, 50),
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white, fontSize: 20),
      ),
    );
  }
}
