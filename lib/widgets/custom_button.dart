import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

class mainButton extends StatelessWidget {
  const mainButton({
    super.key,
    required this.text,
    this.outlinleButton = false,
    required this.onPressed,
  });
  final String text;
  final bool outlinleButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: outlinleButton ? Colors.transparent : primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: outlinleButton ? primaryColor : Colors.white,
        ),
      ),
    );
  }
}
