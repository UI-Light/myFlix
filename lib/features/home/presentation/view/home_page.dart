import 'package:flutter/material.dart';
import 'package:myflix/features/home/presentation/view_model/home_view_model.dart';
import 'package:myflix/features/home/presentation/widgets/movie_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await homeViewModel.refresh();
        },
        //TODO: Handle No internet connection state
        child: ListView(
          padding: const EdgeInsets.only(left: 8.0),
          children: [
            ValueListenableBuilder(
                valueListenable: homeViewModel.trendingMovies,
                builder: (context, trendingMovies, _) {
                  return MovieListView(
                    title: 'Trending',
                    movies: trendingMovies,
                  );
                }),
            ValueListenableBuilder(
                valueListenable: homeViewModel.topRatedMovies,
                builder: (context, topRatedMovies, _) {
                  return MovieListView(
                    title: 'Top Rated',
                    movies: topRatedMovies,
                  );
                }),
            ValueListenableBuilder(
                valueListenable: homeViewModel.popularMovies,
                builder: (context, popularMovies, _) {
                  return MovieListView(
                    title: 'Popular',
                    movies: popularMovies,
                  );
                }),
            ValueListenableBuilder(
                valueListenable: homeViewModel.upcomingMovies,
                builder: (context, upcomingMovies, _) {
                  return MovieListView(
                    title: 'Upcoming',
                    movies: upcomingMovies,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
