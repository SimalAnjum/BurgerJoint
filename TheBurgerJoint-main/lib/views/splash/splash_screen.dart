import 'package:flutter/material.dart';
import 'dart:async';  
import 'package:lottie/lottie.dart';
import 'package:theburgerjoint/views/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(255, 247, 128, 1),
          child: Center(
            child: Lottie.asset(
              'lotties/splash_burger.json',
              height: 300,
              width: 300,
              fit: BoxFit.contain, // Adjust the fit as per your preference)
            ),

          ),
        )
    );
  }
}

