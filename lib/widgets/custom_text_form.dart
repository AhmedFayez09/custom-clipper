import '../app.dart';

class MainTextForm extends StatelessWidget {
  const MainTextForm(
      {super.key,
      required this.text,
      required this.icon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.ontap,
      this.focus,
      this.validator,
      this.onChanged,
      this.controller});
  final String text;
  final IconData icon;
  final IconData? suffixIcon;
  final bool? focus;
  final bool? obscureText;
  final void Function()? ontap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
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
