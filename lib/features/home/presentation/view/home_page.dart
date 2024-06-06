import 'package:flutter/material.dart';
import 'package:myflix/core/services/connectivity_service.dart';
import 'package:myflix/features/home/presentation/view_model/home_view_model.dart';
import 'package:myflix/features/home/presentation/widgets/movie_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();
  ConnectivityService connectivityService = ConnectivityService();

  bool? previousConnectionState;

  void connectionState(bool? hasInternetConnection) {
    if (hasInternetConnection == false) {
      Future.microtask(
          () => _showSnackbar(context, "You are offline", Colors.red[900]!));
    }
    if (previousConnectionState == false && hasInternetConnection == true) {
      Future.microtask(() {
        _showSnackbar(context, "You are back online", Colors.green);
        homeViewModel.refresh();
      });
    }
    previousConnectionState = hasInternetConnection;
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        backgroundColor: color,
      ),
    );
  }

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
      body: StreamBuilder(
        stream: connectivityService.networkStatus,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);
          connectionState(snapshot.data);
          return ValueListenableBuilder(
            valueListenable: homeViewModel.hasError,
            builder: (context, hasError, _) {
              return hasError
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Problem loading movies',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              homeViewModel.refresh();
                            },
                            child: const Text(
                              'Retry',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ValueListenableBuilder(
                      valueListenable: homeViewModel.moviesLoading,
                      builder: (context, loading, _) {
                        return loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.red[900]),
                                ),
                              )
                            : RefreshIndicator(
                                color: Colors.black,
                                onRefresh: () async {
                                  await homeViewModel.refresh();
                                },
                                child: ListView(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  children: [
                                    ValueListenableBuilder(
                                        valueListenable:
                                            homeViewModel.trendingMovies,
                                        builder: (context, trendingMovies, _) {
                                          return MovieListView(
                                            title: 'Trending',
                                            movies: trendingMovies,
                                          );
                                        }),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            homeViewModel.topRatedMovies,
                                        builder: (context, topRatedMovies, _) {
                                          return MovieListView(
                                            title: 'Top Rated',
                                            movies: topRatedMovies,
                                          );
                                        }),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            homeViewModel.popularMovies,
                                        builder: (context, popularMovies, _) {
                                          return MovieListView(
                                            title: 'Popular',
                                            movies: popularMovies,
                                          );
                                        }),
                                    ValueListenableBuilder(
                                        valueListenable:
                                            homeViewModel.upcomingMovies,
                                        builder: (context, upcomingMovies, _) {
                                          return MovieListView(
                                            title: 'Upcoming',
                                            movies: upcomingMovies,
                                          );
                                        }),
                                  ],
                                ),
                              );
                      },
                    );
            },
          );
        },
      ),
    );
  }
}
