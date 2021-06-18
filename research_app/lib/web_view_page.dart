import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebViewPage"),
      ),
      body: WebView(
//          initialUrl: 'https://www.pref.kyoto.jp/kenkoshishin/documents/no_1.pdf',
          initialUrl: 'https://www.kansaigaidai.ac.jp/asp/img/pdf/82/7a79c35f7ce0704dec63be82440c8182.pdf',
      ),
    );
  }
}
