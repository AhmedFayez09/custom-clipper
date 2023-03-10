import '../app.dart';

const Color primaryColor = Colors.deepPurple;

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  child: const Text(
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
