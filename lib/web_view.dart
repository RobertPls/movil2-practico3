import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final Map<String, dynamic> args;
  const WebViewPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = args['url'];

    return Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
