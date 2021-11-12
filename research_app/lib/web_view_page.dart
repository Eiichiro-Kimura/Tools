import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as WebViewA;
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as WebViewB;

const initialUrl = 'https://www.google.com';
const pdfUrl = 'https://www.pref.kyoto.jp/kenkoshishin/documents/no_1.pdf';
const docsUrl = 'https://docs.google.com/gview?embedded=true&url=';
const pdfExt = '.pdf';

class WebViewPageA extends StatelessWidget {

  WebViewA.WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebViewPageA"),
      ),
      body: WebViewA.WebView(
        initialUrl: initialUrl,
        javascriptMode: WebViewA.JavascriptMode.unrestricted,
        onWebViewCreated: _onWebViewCreated,
        onPageStarted: _onPageStarted,
        navigationDelegate: _navigationDelegate,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(Icons.update),
      ),
    );
  }

  void _onWebViewCreated(WebViewA.WebViewController controller) => _controller = controller;

  void _onPageStarted(String url) {
    if (Platform.isAndroid && url.endsWith(pdfExt)) {
      _controller?.loadUrl(docsUrl + url);
    }
  }

  WebViewA.NavigationDecision _navigationDelegate(WebViewA.NavigationRequest navigationRequest) {
    final url = navigationRequest.url;

    if (Platform.isAndroid && url.endsWith(pdfExt)) {
      _controller?.loadUrl(docsUrl + url);

      return WebViewA.NavigationDecision.prevent;
    } else {
      return WebViewA.NavigationDecision.navigate;
    }
  }

  void _onPressed() => _controller?.loadUrl(pdfUrl);
}

class WebViewPageB extends StatelessWidget {

  WebViewB.InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebViewPageA"),
      ),
      body: WebViewB.InAppWebView(
        initialUrlRequest: _toUrlRequest(initialUrl),
        initialOptions: WebViewB.InAppWebViewGroupOptions(
          crossPlatform: WebViewB.InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
          android: WebViewB.AndroidInAppWebViewOptions(
            useShouldInterceptRequest: true,
          )
        ),
        onWebViewCreated: _onWebViewCreated,
        androidShouldInterceptRequest: _androidShouldInterceptRequest,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(Icons.update),
      ),
    );
  }

  WebViewB.URLRequest _toUrlRequest(String uri) => WebViewB.URLRequest(url: Uri.parse(uri));

  void _onWebViewCreated(WebViewB.InAppWebViewController controller) => _controller = controller;

  Future<WebViewB.WebResourceResponse?> _androidShouldInterceptRequest(WebViewB.InAppWebViewController controller, WebViewB.WebResourceRequest request) {
    final url = request.url.toString();

    if (Platform.isAndroid && !url.startsWith(docsUrl) && url.endsWith(pdfExt)) {
      _controller?.stopLoading().then(
              (value) => _controller?.loadUrl(urlRequest: _toUrlRequest(docsUrl + url))
      );
    }

    return Future.value(null);
  }

  void _onPressed() => _controller?.loadUrl(urlRequest: _toUrlRequest(pdfUrl));
}
