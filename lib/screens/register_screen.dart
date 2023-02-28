
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_clipper.dart';

import '../widgets/register_body.dart';
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
