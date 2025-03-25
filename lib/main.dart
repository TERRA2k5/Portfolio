import 'package:flutter/material.dart';
import 'package:portfolio/MainContainer.dart';
import 'package:portfolio/UI/HomePage.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MainContainer();
  }
}
