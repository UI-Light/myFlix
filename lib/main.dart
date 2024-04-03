import 'package:flutter/material.dart';
import 'package:myflix/features/details/presentation/view/movie_details_page.dart';
import 'package:myflix/views/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IndexPage(),
        '/details': (context) => const MovieDetailsPage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
