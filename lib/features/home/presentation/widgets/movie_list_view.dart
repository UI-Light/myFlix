import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';

class MovieListView extends StatelessWidget {
  final String title;
  const MovieListView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MovieCard(),
              MovieCard(),
              MovieCard(),
            ],
          ),
        ),
      ],
    );
  }
}
