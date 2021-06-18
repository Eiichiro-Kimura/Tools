import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebViewPage"),
      ),
      body: WebView(
//          initialUrl: 'https://www.pref.kyoto.jp/kenkoshishin/documents/no_1.pdf',
        initialUrl: 'https://docs.google.com/gview?embedded=true&url=https://www.pref.kyoto.jp/kenkoshishin/documents/no_1.pdf',
        onWebViewCreated: _onWebViewCreated,
        navigationDelegate: _navigationDelegate,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _onWebViewCreated(WebViewController controller) => _controller = controller;

  NavigationDecision _navigationDelegate(NavigationRequest navigationRequest) {
    final url = navigationRequest.url;

    if (url.endsWith('.pdf')) {
      _controller?.loadUrl('https://docs.google.com/gview?embedded=true&url=' + url);

      return NavigationDecision.navigate;
    } else {
      return NavigationDecision.prevent;
    }
  }
}
