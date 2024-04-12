import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';

class SimilarMoviesListView extends StatefulWidget {
  final String title;
  final List<Movie> movie;
  const SimilarMoviesListView(
      {super.key, required this.title, required this.movie});

  @override
  State<SimilarMoviesListView> createState() => _SimilarMoviesListViewState();
}

class _SimilarMoviesListViewState extends State<SimilarMoviesListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 300,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              crossAxisSpacing: 2,
            ),
            scrollDirection: Axis.vertical,
            itemCount: widget.movie.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: widget.movie[index]);
            },
          ),
        ),
      ],
    );
  }
}
