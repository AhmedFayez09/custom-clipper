import '../app.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  var loginKey = GlobalKey<FormState>();
  final bool focusPass = false;
  var nameC = TextEditingController();
  var passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginKey,
          child: ListView(
            children: [
              MainTextForm(
                text: "Full Name",
                controller: nameC,
                icon: Icons.person,
                validator: (value) {
                  if (value == null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 5),
              MainTextForm(
                controller: passwordC,
                ontap: () {
                  setState(() {
                    focusPass != focusPass;
                  });
                },
                text: "Password",
                obscureText: focusPass,
                icon: Icons.password,
                suffixIcon: focusPass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                validator: (value) {
                  if (value == null) {
                    return 'Invalid Value';
                  }
                },
              ),
              const SizedBox(height: 20),
              mainButton(
                text: 'Login',
                onPressed: () {
                  print('fddd');
                  if (loginKey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => const HomeScreen()));
                  }
                },
              ),
              const SizedBox(height: 10),
              mainButton(
                text: 'Register',
                outlinleButton: true,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) => const RegisterScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
