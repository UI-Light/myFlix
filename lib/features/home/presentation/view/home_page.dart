import 'package:flutter/material.dart';
import 'package:myflix/features/home/presentation/widgets/movie_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MyFlix',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView(
          children: const [
            MovieListView(title: 'Trending'),
            MovieListView(title: 'Top Rated'),
            MovieListView(title: 'Popular'),
          ],
        ),
      ),
    );
  }
}
