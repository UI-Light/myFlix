import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';

class MovieListView extends StatelessWidget {
  final String title;
  final double size;
  const MovieListView({super.key, required this.title, this.size = 22});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const MovieCard();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
