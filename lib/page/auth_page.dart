import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
 final TextEditingController _email = TextEditingController();
 final TextEditingController _password = TextEditingController();
 bool isLogin = true;
 bool errorLogin = false;
 bool errorRegister = false;

  Future<void> signIn() async {
    try{
      await Auth().signInWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException catch (error) { errorLogin = true; print(error.message); }
  }
  Future<void> register() async {
    try{
      await Auth().createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException catch (error) { errorRegister = true; print(error.message);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo App")
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(label: Text('email')),
          ),
          TextField(
            controller: _password,
            decoration: const InputDecoration(label: Text('password')),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              isLogin ? signIn() : register();
            }, 
            child: Text(isLogin ? 'Log in' : 'Sign in')),
          TextButton(
          onPressed: () {
          setState(() {
            isLogin = !isLogin;
            errorLogin = false;
            errorRegister = false;
          });
          }, 
          child: Text(isLogin ? 'Do not have an account? Sign in!' : 'Do you have an account? Login!'),
          ),
          Text(errorLogin ? 'Attention wrong email or password!' : errorRegister ? 'Attention email or password already used' : '', 
          style: const TextStyle(color: Colors.red),),
        ]
      ),
    );
    
  }
}