import 'package:flutter/material.dart';
import 'package:nlw5/core/app_gradients.dart';
import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: AppGradients.linear,
      ),
      child: Center(child: Image.asset(AppImages.logo)),
    ));
  }
}
