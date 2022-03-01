import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  MyWebView();

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
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: "https://www.sanaullastore.com/",
          javascriptMode: JavascriptMode.unrestricted,
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
