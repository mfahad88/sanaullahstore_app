import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sanaullahstore_app/view/MyWebView.dart';
import 'package:webview_flutter/webview_flutter.dart';



class HomeScreen extends StatelessWidget {
  var loadingPercentage = 0;
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    Future<bool> isConnected=_checkInternetConnection();
    return Scaffold(
        body: SafeArea(
          child:FutureBuilder<bool>(
            future: isConnected,
            builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.data==true){
                      return MyWebView();
                    }else{
                      return Center(child: Text(
                          'Please check your internet connection and retry'));
                    }

                  }


              return Center(child: CircularProgressIndicator());
          },)
        ),
      );
  }


  Future<bool> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.sanaullastore.com');
      print(response.isNotEmpty);
      if (response.isNotEmpty) {
        return true;
      }
    } on SocketException catch (err) {
      return false;
    }
    return false;
  }
}
