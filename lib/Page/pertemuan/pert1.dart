import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Android"),
        ),
        body: const Center(
          child: Text(
            "Selamat Datang di Android",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}