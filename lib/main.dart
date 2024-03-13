import 'package:flutter/material.dart';
import 'package:myfit/view/home_view.dart';

void main() {
  runApp(const MyFitApp());
}

class MyFitApp extends StatelessWidget {
  const MyFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SafeArea(
          child: HomeView()
        ),
      ),
    );
  }
}


