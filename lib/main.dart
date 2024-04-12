import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myflix/core/dependencies/registry.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/routes.dart';
import 'package:myflix/core/utils/logger.dart';
import 'package:myflix/features/details/presentation/view/movie_details_page.dart';
import 'package:myflix/views/index_page.dart';

void main() {
  AppLogger.configure(showLogs: kDebugMode);
  registerdependencies(
      baseUrl: const String.fromEnvironment('BASE_URL'),
      token: const String.fromEnvironment('TMDB_READ_ACCESS_TOKEN'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.homeRoute: (context) => const IndexPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Routes.detailsRoute) {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(movie: movie),
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
