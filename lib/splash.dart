import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 6),
            ()=> Navigator.of(context).pushReplacementNamed('/login'));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        widthFactor: 150,
        heightFactor: 150,
        child: Image.asset('assets/Images/giphy.gif'),
        //child: SvgPicture.asset('assets/Images/upload.svg'),
      ),
    );
  }
}
