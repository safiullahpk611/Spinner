// @dart=2.9
import 'package:flutter/material.dart';
import 'package:spinzy/ui/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spinzy',
      theme: ThemeData(
        fontFamily: "workSans"
      ),
      home: const SplashScreen(),
    );
  }
}
