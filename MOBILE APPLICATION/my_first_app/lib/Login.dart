import 'package:auth_app/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login( BuildContext context) async{
try{
 await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text.trim(),
   password: passwordController.text.trim());
} catch(e){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Login Failed: \$e"))
    );
}
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration:  const InputDecoration(
                labelText: "Email"
              ),
            ),
            TextField(
              controller: passwordController,
              
              obscureText: true,
              decoration:  const InputDecoration(
                labelText: "Password"
              ),
            ),
            ElevatedButton(onPressed: (){},
             child: const Text("Login"), 
              ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
               MaterialPageRoute(
                builder: (context) => Register()));
            },
             child: const Text("Register"), 
              ),
          ],
      ),
      ),
      
    );
  }
}