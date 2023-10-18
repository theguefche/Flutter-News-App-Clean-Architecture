import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Splash Screen PlaceHolder"),
        SizedBox(
          height: 100,
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
