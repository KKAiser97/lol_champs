import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/champ/champs_route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ChampsRoute.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/project_lol.gif"),
        fit: BoxFit.cover,
      ),
    ));
  }
}
