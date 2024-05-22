import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

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
  late final String viewUrl =
      'https://vidsrc.to/embed/movie/${widget.movie.movieId}';
  late final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (request) {
          final host = Uri.parse(request.url).host;
          if (host != viewUrl) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
      Uri.parse('https://vidsrc.to/embed/movie/${widget.movie.movieId}'),
    );

  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //   ]);
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
