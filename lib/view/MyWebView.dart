import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {

  Function (BuildContext context,WebViewController webViewController) onWebViewCreated;

  MyWebView({required this.onWebViewCreated});

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {


  double loadingPercentage=0;
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    if (Platform.isIOS) WebView.platform = CupertinoWebView();
    // controller.loadUrl("http://google.com");
  }
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _completer =
    Completer<WebViewController>();
    WebViewController _webViewController;
    _completer.future.then((controller) {
      _webViewController = controller;
      Map<String, String> header =  {'x-is-app': true.toString()};
      _webViewController.loadUrl("https://www.sanaullastore.com/", headers: header);
    });
    return Stack(
      children: [
        WebView(

          // initialUrl: "https://www.sanaullastore.com/",

          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _completer.complete(webViewController);
            widget.onWebViewCreated(context,webViewController);
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
