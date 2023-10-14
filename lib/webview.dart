import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // For Loading Sign
  bool isLoading = true;

  // Webview Controller
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();

    WebViewController newcontroller = WebViewController();
    newcontroller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('http://68.178.168.99:8000/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse('http://68.178.168.99:8000/'),
      );
    if (mounted) {
      setState(() {
        controller = newcontroller;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : WebViewWidget(controller: controller),
        // Bottom Navigation Bar
      ),
    );
  }
}
