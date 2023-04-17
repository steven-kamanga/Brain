import 'package:flutter/material.dart';
import 'app/screens/landing.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Landing(),
    );
  }
}
