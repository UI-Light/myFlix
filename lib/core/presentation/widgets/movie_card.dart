import 'package:flutter/material.dart';
import 'package:myflix/features/details/presentation/view/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MovieDetailsPage(),
            ),
          );
        },
        child: Container(
          height: 180,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'asset/poster.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
