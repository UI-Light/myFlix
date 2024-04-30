import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/routes.dart';
import 'package:myflix/features/details/presentation/view_model/details_view_model.dart';
import 'package:myflix/features/details/presentation/widgets/backdrop_error_card.dart';
import 'package:myflix/features/details/presentation/widgets/backdrop_loading_card.dart';
import 'package:myflix/features/details/presentation/widgets/button.dart';
import 'package:myflix/features/details/presentation/widgets/similar_movies_list.dart';
import 'package:myflix/features/watchlist/presentation/view_model/watchlist_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  DetailsViewModel detailsViewModel = DetailsViewModel();

  final ValueNotifier<bool> _movieInWatchList = ValueNotifier(false);

  void saveMovie(Movie movie) {
    if (_movieInWatchList.value) {
      context.read<WatchListViewModel>().removeFromWatchList(movie);
      _movieInWatchList.value = false;
      showSnackbar(context, 'Removed from Watchlist');
    } else {
      context.read<WatchListViewModel>().addToWatchList(movie);
      _movieInWatchList.value = true;
      showSnackbar(context, 'Added to Watchlist');
    }
  }

  void showSnackbar(BuildContext context, String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> checkForMovie() async {
    _movieInWatchList.value =
        await context.read<WatchListViewModel>().movieInWatchlist(widget.movie);
  }

  @override
  void initState() {
    super.initState();
    detailsViewModel.getSimilarMovies(widget.movie);
    checkForMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: widget.movie.backdropUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.movieWebViewRoute,
                        arguments: widget.movie,
                      );
                    },
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return const BackdropLoadingCard();
              },
              errorWidget: (context, url, error) {
                return const BackdropErrorCard();
              }),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                Text(
                  widget.movie.movieTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16),
                    text: widget.movie.year.substring(0, 4),
                    children: [
                      const TextSpan(
                          text: ' • ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '${widget.movie.averageRating.toStringAsFixed(2)}/10',
                          style: TextStyle(color: Colors.red[900])),
                      const TextSpan(text: '  on TMDB'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.movie.overview,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'My List',
                      content: ValueListenableBuilder(
                          valueListenable: _movieInWatchList,
                          builder: (context, value, _) {
                            return Icon(
                              value ? Icons.check : Icons.add,
                              color: Colors.white,
                            );
                          }),
                      onTap: () => saveMovie(widget.movie),
                    ),
                    Button(
                      text: 'Watch',
                      content: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          //     size: 28,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.movieWebViewRoute,
                          arguments: widget.movie,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                    valueListenable: detailsViewModel.similarMovies,
                    builder: (context, movies, _) {
                      return SimilarMoviesListView(
                        title: 'Similar Movies',
                        movie: movies,
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
