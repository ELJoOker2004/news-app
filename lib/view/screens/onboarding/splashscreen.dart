import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/constants.dart';
import 'package:news/view/screens/home/HomeScreen.dart';
import 'package:news/view/screens/home/layout.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: SvgPicture.asset(imgSplash),
        centered: true,
        duration: 2000,
        splashIconSize: double.infinity,
        backgroundColor: white,
        nextScreen: layoutScreen());
  }
}
