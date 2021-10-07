import 'package:flutter/material.dart';
import 'package:jobswire/color/color_theme.dart';
import 'package:jobswire/image/image.dart';
import 'package:jobswire/pages/HomePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().padua.withOpacity(0.8),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
            ImageAssets.logo,
          ),
        )),
      ),
    );
  }
}
