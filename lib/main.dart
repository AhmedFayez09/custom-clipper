import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyWaveClipper());
  }
}

const Color primaryColor = Colors.deepPurple;

class MyWaveClipper extends StatelessWidget {
  MyWaveClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: primaryColor,
                    height: 270,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: primaryColor,
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Body(),
        ],
      ),
    );
  }
}

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
            MainTextForm(
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height); // start path with this if you are making
    var firstStart = Offset(size.width / 5, size.height);
    // first point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    // second point of quadratic bezier curve
    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    // third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    // fourth point of quadratic bezier curve
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0); // end with this path if you are making
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

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

class mainButton extends StatelessWidget {
  const mainButton({
    super.key,
    required this.text,
    this.outlinleButton = false,
  });
  final String text;
  final bool outlinleButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
