import 'package:flutter_application_1/app.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var focusPass = false;

  var focusConPass = false;
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: registerKey,
          child: ListView(
            children: [
              MainTextForm(
                text: "Full Name",
                icon: Icons.person,
                validator: (value) {
                  if (value != null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 5),
              MainTextForm(
                text: "Email",
                icon: Icons.email,
                validator: (value) {
                  if (value != null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 5),
              MainTextForm(
                keyboardType: TextInputType.phone,
                text: "Phone",
                icon: Icons.phone,
                validator: (value) {
                  if (value != null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 5),
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
                validator: (value) {
                  if (value != null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 5),
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
                validator: (value) {
                  if (value != null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 20),
              mainButton(
                text: 'Register',
                onPressed: () {
                  print('fddd');
                  if (registerKey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => const HomeScreen()));
                  }
                },
              ),
              const SizedBox(height: 10),
              mainButton(
                text: 'Login',
                outlinleButton: true,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => const LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
