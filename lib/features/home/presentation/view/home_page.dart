import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_box.dart';
import 'package:myflix/views/index_page.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MovieBox(),
                    MovieBox(),
                    MovieBox(),
                  ],
                ),
              ),
              Text(
                'Top Rated',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MovieBox(),
                    MovieBox(),
                    MovieBox(),
                  ],
                ),
              ),
              Text(
                'Popular',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MovieBox(),
                    MovieBox(),
                    MovieBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
