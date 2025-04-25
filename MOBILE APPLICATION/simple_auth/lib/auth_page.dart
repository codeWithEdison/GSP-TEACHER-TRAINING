import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _auth = FirebaseAuth.instance;
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool isLogin = true;

  void authAction() async {
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: emailCtrl.text, password: passCtrl.text);
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: emailCtrl.text, password: passCtrl.text);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  void logout() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth")),
      body: Center(
        child: user == null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
                  TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: authAction, child: Text(isLogin ? "Login" : "Register")),
                  TextButton(onPressed: () => setState(() => isLogin = !isLogin), child: Text(isLogin ? "Create account" : "Already have an account?"))
                ]),
              )
            : Column(mainAxisSize: MainAxisSize.min, children: [
                Text("Logged in as: ${user.email}"),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: logout, child: const Text("Logout"))
              ]),
      ),
    );
  }
}
