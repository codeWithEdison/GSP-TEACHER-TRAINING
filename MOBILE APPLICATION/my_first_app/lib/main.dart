import 'package:auth_app/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure that plugin services are initialized so that Firebase can use them
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}