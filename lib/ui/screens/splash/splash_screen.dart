import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../custom_widgets/custom_page_route.dart';


import '../spaning_wheel/spaning_wheel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // _apiServices.getAlquranLineArabic();
    // _apiServices.getAlquranLineEnglish();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SpaningWheel()));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text("Spinner",style: TextStyle(fontSize: 45,color: Colors.white,
        fontFamily: "RussoOne"
        ),),
      ),
    );
  }
}
