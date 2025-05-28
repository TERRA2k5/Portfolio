import 'package:flutter/material.dart';
import 'package:portfolio/MainContainer.dart';
import 'package:portfolio/UI/HomePage.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer();
  }
}
