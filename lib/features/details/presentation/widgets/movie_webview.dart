import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieWebView extends StatefulWidget {
  final WebViewController controller;
  final Movie movie;
  const MovieWebView(
      {super.key, required this.controller, required this.movie});

  @override
  State<MovieWebView> createState() => _MovieWebViewState();
}

class _MovieWebViewState extends State<MovieWebView> {
  @override
  void initState() {
    super.initState();
    widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      
      controller: widget.controller,
    );
  }
}
