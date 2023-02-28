
import 'package:flutter/material.dart';

class MainTextForm extends StatelessWidget {
  const MainTextForm(
      {super.key,
      required this.text,
      required this.icon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.ontap,
      this.focus});
  final String text;
  final IconData icon;
  final IconData? suffixIcon;
  final bool? focus;
  final bool? obscureText;
  final void Function()? ontap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText!, 
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: InkWell(onTap: ontap, child: Icon(suffixIcon)),
        hintText: text,
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
