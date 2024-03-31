import 'package:flutter/material.dart';
import 'package:myflix/features/home/presentation/widgets/movie_scroll_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieScrollView(title: 'Trending'),
              MovieScrollView(title: 'Top Rated'),
              MovieScrollView(title: 'Popular'),
            ],
          ),
        ),
      ),
    );
  }
}
