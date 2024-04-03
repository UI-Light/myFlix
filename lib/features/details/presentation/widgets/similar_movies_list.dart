import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';

class SimilarMoviesListView extends StatefulWidget {
  final String title;
  const SimilarMoviesListView({super.key, required this.title});

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
        const SizedBox(height: 2),
        SizedBox(
          height: 300,
          child: GridView(
            //shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            scrollDirection: Axis.vertical,
            children: const [
              MovieCard(),
              MovieCard(),
              MovieCard(),
              MovieCard(),
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
