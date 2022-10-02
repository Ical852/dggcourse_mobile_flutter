import 'dart:async';

import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/get-started");
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 128,
                height: 142,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png")
                  )
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "D Gg Courses",
                style: poppinsText.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                  color: white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}