import 'package:auth_app/Login.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
             child: const Text("Register"), 
              ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
               MaterialPageRoute(
                builder: (context) => Login()));
            },
             child: const Text("Have Account back to login "), 
              ),
          ],
      ),
      ),
      
    );
  }
}