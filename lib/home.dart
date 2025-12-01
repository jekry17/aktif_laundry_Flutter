import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  WebViewController ? _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://aktif-laundry-mysql.vercel.app/'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: WebViewWidget(controller: _controller!),
    );
  }
  
}