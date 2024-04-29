import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieWebView extends StatefulWidget {
  final Movie movie;
  const MovieWebView({
    super.key,
    required this.movie,
  });

  @override
  State<MovieWebView> createState() => _MovieWebViewState();
}

class _MovieWebViewState extends State<MovieWebView> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse('https://vidsrc.to/embed/movie/${widget.movie.movieId}'),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
