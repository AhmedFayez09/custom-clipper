import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var focusPass = false;

  var focusConPass = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MainTextForm(
              text: "Full Name",
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            MainTextForm(
              text: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: 10),
            MainTextForm(
              keyboardType: TextInputType.phone,
              text: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(height: 10),
            MainTextForm(
              ontap: () {
                setState(() {});
                focusPass = !focusPass;
              },
              text: "Password",
                 obscureText: focusPass,
              icon: Icons.password,
              suffixIcon: focusPass
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            SizedBox(height: 10),
            MainTextForm(
              ontap: () {
                focusConPass = !focusConPass;
                setState(() {});
                print(focusConPass);
              },
              text: "Confirm Password",
              obscureText: focusConPass,
              icon: Icons.password,
              suffixIcon: focusConPass
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            SizedBox(height: 40),
            mainButton(text: 'Register'),
            SizedBox(height: 20),
            mainButton(
              text: 'Login',
              outlinleButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
