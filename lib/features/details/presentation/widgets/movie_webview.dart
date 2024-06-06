import 'package:flutter/material.dart';
import 'package:floating/floating.dart';
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

class _MovieWebViewState extends State<MovieWebView>
    with WidgetsBindingObserver {
  final floating = Floating();
  bool canUsePiP = false;

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

  void pipAvailability() async {
    print('initial value of canUsepip : $canUsePiP');
    print('checking for pip availabilty');
    canUsePiP = await floating.isPipAvailable;
    print('Check for pip availabilty done: $canUsePiP');
  }

  @override
  void initState() {
    super.initState();
    pipAvailability();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('current AppLifecycle state : $state');
    print('canusePiP status: $canUsePiP');
    if (state == AppLifecycleState.inactive && canUsePiP == true) {
      floating.enable(
        EnableManual(
          aspectRatio: const Rational.landscape(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: PiPSwitcher(
        childWhenDisabled: SafeArea(
          child: Scaffold(
            body: WebViewWidget(controller: controller),
          ),
        ),
        childWhenEnabled: WebViewWidget(controller: controller),
      ),
    );
  }
}
