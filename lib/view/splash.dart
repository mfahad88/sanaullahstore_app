

import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanaullahstore_app/view/CirclePaint.dart';
import 'package:sanaullahstore_app/view/home_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyACIAEVFtIxu3atEHTWDykfOMWtevo5-oo",
        appId: "1:437042386926:android:d951ee771b67d85b32a0ff", messagingSenderId: "437042386926", projectId: "sanaullastore-1ed15")
  ).then((value) => print(value));
  runApp(MaterialApp(home: SplashScreen(),));
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late FirebaseMessaging messaging;

  @override
  void initState() {

    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print("here ${value}");
    });

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