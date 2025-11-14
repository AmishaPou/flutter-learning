import 'package:educa_app/screens/login_page.dart';
import 'package:educa_app/screens/montreal_screen.dart';
import 'package:educa_app/screens/profile_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Educa App',
      
      home: const LoginPage(),
    );
  }
}
