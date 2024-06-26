import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myflix/core/dependencies/registry.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/constants.dart';
import 'package:myflix/core/utils/routes.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/details/presentation/view/movie_details_page.dart';
import 'package:myflix/features/details/presentation/widgets/movie_webview.dart';
import 'package:myflix/features/watchlist/presentation/view_model/watchlist_view_model.dart';
import 'package:myflix/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>(boxName);

  AppLogger.configure(showLogs: kDebugMode);
  registerdependencies(
      baseUrl: const String.fromEnvironment('BASE_URL'),
      token: const String.fromEnvironment('TMDB_READ_ACCESS_TOKEN'));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      Provider(
        create: (_) => WatchListViewModel(),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.splashRoute: (context) => const SplashScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Routes.detailsRoute) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(movie: movie),
          );
        } else if (settings.name == Routes.movieWebViewRoute) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieWebView(
              movie: movie,
            ),
          );
        }
      },
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
