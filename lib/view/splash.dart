

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanaullahstore_app/view/CirclePaint.dart';
import 'package:sanaullahstore_app/view/home_screen.dart';
import 'package:http/http.dart' as http;

void main() {

  runApp(MaterialApp(home: SplashScreen(),));
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();


    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context){

              return HomeScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffec248f),
        body:SafeArea(child: Stack(
          fit: StackFit.expand,
          children: [
            Stack(
              children: [
                Center(
                  child: CustomPaint(
                    painter: CirclePaint(),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: SvgPicture.asset('images/splash.svg',
                      color: Color(0xffec248f),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text("Sanaulla Store",
                          style: TextStyle(color: Colors.white,fontSize: 22.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ))
    );
  }





}