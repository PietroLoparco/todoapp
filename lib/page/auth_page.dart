import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
 final TextEditingController _confirmpassword = TextEditingController();
 bool isLogin = true;
 bool errorLogin = false;
 bool errorRegister = false;
 bool obscure = true;
 bool obscure2 = true;

  Future<void> signIn() async {
    try{
      await Auth().signInWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException { setState(() {errorLogin = true;}); }
  }
  Future<void> register() async {
    try{
      await Auth().createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException { setState(() {errorRegister = true;});}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 32),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 32),
        title: const Text("Login for your ToDoApp", style: TextStyle(color: Colors.grey),)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25,right: 25,bottom: 10, top: 30),
              padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
              decoration: BoxDecoration(
                color:const Color.fromARGB(251, 15, 59, 113),
                borderRadius: BorderRadius.circular(100) 
              ),
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.35,
              child: Icon(CupertinoIcons.person, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.30,),
            ),
            Container(
               margin: const EdgeInsets.only(left: 25,right: 25,bottom: 10, top: 30),
               padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
               decoration: BoxDecoration(
                 color:const Color.fromARGB(251, 15, 59, 113),
                 borderRadius: BorderRadius.circular(17),
                 border: Border.all(
                   color: const Color.fromRGBO(42, 38, 48, 1),
                 ),
               ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _email,
                decoration: const InputDecoration(label: Text('email', style: TextStyle(color: Colors.grey),), border: InputBorder.none,),
              ),
            ),
      
            Container(
               margin: const EdgeInsets.only(left: 25,right: 25,bottom: 30, top: 30),
               padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
               decoration: BoxDecoration(
                 color:const Color.fromARGB(251, 15, 59, 113),
                 borderRadius: BorderRadius.circular(17),
                 border: Border.all(
                   color: const Color.fromRGBO(42, 38, 48, 1),
                 ),
               ),
              child: TextField(
                controller: _password,
                style: const TextStyle(color: Colors.white),
                obscureText: obscure,
                decoration: InputDecoration(
                  label: const Text('password', style: TextStyle(color: Colors.grey),), 
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {setState(() {obscure = !obscure;});},
                    icon: Icon(!obscure ? CupertinoIcons.eye: CupertinoIcons.eye_slash, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.06,),
                  )
                  ),
              ),
            ),

            Container(
               margin: const EdgeInsets.only(left: 25,right: 25,bottom: 30, top: 0),
               padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
               decoration: BoxDecoration(
                 color:const Color.fromARGB(251, 15, 59, 113),
                 borderRadius: BorderRadius.circular(17),
                 border: Border.all(
                   color: const Color.fromRGBO(42, 38, 48, 1),
                 ),
               ),
              child: TextField(
                controller: _confirmpassword,
                style: const TextStyle(color: Colors.white),
                obscureText: obscure2,
                decoration: InputDecoration(
                  label: const Text('confirm password', style: TextStyle(color: Colors.grey),), 
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {setState(() {obscure2 = !obscure2;});},
                    icon: Icon(!obscure2 ? CupertinoIcons.eye: CupertinoIcons.eye_slash, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.06,),
                  )
                  ),
              ),
            ),
      
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  isLogin ? signIn() : _password.text == _confirmpassword.text ? register() : setState(() {errorRegister = true;},);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(250, 20, 88, 170),
                ),
                child: Text(isLogin ? 'Log in' : 'Sign in')),
            ),
      
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
            Text(errorLogin ? 'Attention wrong email or password!' : errorRegister ? 'Attention email or password already used or incorrect' : '', 
            style: const TextStyle(color: Colors.red),),
          ]
        ),
      ),
    );
    
  }
}