import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';
import 'package:myflix/features/watchlist/presentation/view_model/watchlist_view_model.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  WatchListViewModel watchListViewModel = WatchListViewModel();

  @override
  void initState() {
    super.initState();
    watchListViewModel.getWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 8.0, left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Watch List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              ValueListenableBuilder(
                valueListenable: watchListViewModel.watchListNotifier,
                builder: (context, watchList, _) {
                  return watchList.isEmpty
                      ? const Center(
                          child: Text('No Movie in WatchList'),
                        )
                      : Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 3 / 4,
                              mainAxisSpacing: 4,
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: watchList.length,
                            itemBuilder: (context, index) {
                              return MovieCard(movie: watchList[index]);
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
