import 'package:todoapp/page/auth_page.dart';
import 'page/home_page.dart';
import 'package:flutter/material.dart';
import 'Services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Services/auth.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the main of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const AuthPage();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

