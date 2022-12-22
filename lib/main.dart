import 'package:flutter/material.dart';
import 'package:webview/splash_screen.dart';

void main() => runApp(MyWebView());

class MyWebView extends StatelessWidget {
  MyWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
