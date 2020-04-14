import 'package:dsc_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatelessWidget {
// final String url;
// NewsView({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('News View')
      ),
      body: WebView(
        initialUrl: 'https://google.com',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}