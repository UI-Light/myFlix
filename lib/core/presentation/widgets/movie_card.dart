import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/presentation/widgets/movie_loading_card.dart';
import 'package:myflix/core/routes.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.detailsRoute);
      },
      child: CachedNetworkImage(
        imageUrl: movie.posterUrl,
        imageBuilder: (context, imageProvider) => Container(
          height: 180,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        ),
        placeholder: (context, url) => const MovieLoadingCard(),
      ),
    );
  }
}
