import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {



  MyWebView();

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  double loadingPercentage=0;
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    if (Platform.isIOS) WebView.platform = CupertinoWebView();
  }
  @override
  Widget build(BuildContext context) {
    WebViewController controller;


    return Stack(
      children: [
        WebView(

          initialUrl: "https://www.sanaullastore.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {

            controller = webViewController;
            _controller.complete(webViewController);
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage=progress/100;
              if(loadingPercentage>0 && loadingPercentage<1.0){
                this.isLoading=true;
              }else{
                this.isLoading=false;
              }
            });
          },

        ),
        if (loadingPercentage < 1.0)
          Visibility(
            maintainState: true,
            visible: isLoading,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Color(0xffec248f),
              value: loadingPercentage,
            ),
          ),
      ],

    );


  }
}
