import 'package:flutter/material.dart';
import 'package:myflix/core/routes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.detailsRoute);
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
    );
  }
}
