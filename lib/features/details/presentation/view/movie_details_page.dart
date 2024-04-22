import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/features/details/presentation/view_model/details_view_model.dart';
import 'package:myflix/features/details/presentation/widgets/backdrop_error_card.dart';
import 'package:myflix/features/details/presentation/widgets/backdrop_loading_card.dart';
import 'package:myflix/features/details/presentation/widgets/similar_movies_list.dart';
import 'package:myflix/features/watchlist/presentation/view_model/watchlist_view_model.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  DetailsViewModel detailsViewModel = DetailsViewModel();
  WatchListViewModel watchListViewModel = WatchListViewModel();

  bool movieInWatchList = false;

  void saveMovie(Movie movie) {
    if (movieInWatchList) {
      watchListViewModel.removeFromWatchList(movie);
      movieInWatchList = false;
      watchListViewModel.showSnackbar(context, 'Removed from Watchlist');
    } else {
      watchListViewModel.addToWatchList(movie);
      movieInWatchList = true;
      watchListViewModel.showSnackbar(context, 'Added to Watchlist');
    }
    setState(() {});
  }

  Future<void> checkForMovie() async {
    movieInWatchList = await watchListViewModel.movieInWatchlist(widget.movie);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    detailsViewModel.getSimilarMovies(widget.movie);
    checkForMovie();
  }

  @override
  void didUpdateWidget(covariant MovieDetailsPage oldWidget) {
    if (oldWidget.movie.movieId != widget.movie.movieId) {
      checkForMovie();
    }
    super.didUpdateWidget(oldWidget);
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      saveMovie(widget.movie);
                    },
                    child: Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            movieInWatchList
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'My List',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
