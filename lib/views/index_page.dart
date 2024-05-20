import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflix/core/models/movie_model.dart';
import 'package:myflix/core/utils/routes.dart';
import 'package:myflix/features/details/presentation/view/movie_details_page.dart';
import 'package:myflix/features/details/presentation/widgets/movie_webview.dart';
import 'package:myflix/features/home/presentation/view/home_page.dart';
import 'package:myflix/features/search/presentation/view/search_page.dart';
import 'package:myflix/features/watchlist/presentation/view/watchlist_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final _homePageNavigatorKey = GlobalKey<NavigatorState>();
  final _watchListNavigatorKey = GlobalKey<NavigatorState>();
  final _searchNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('onwill pop ');
        final navigator = switch (selectedIndex) {
          0 => _homePageNavigatorKey,
          1 => _watchListNavigatorKey,
          _ => _searchNavigatorKey,
        };

        final canPop = navigator.currentState!.canPop();

        if (canPop) {
          navigator.currentState?.pop();
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        return false;
      },
      // canPop: false,
      // onPopInvoked: (didPop) {
      //   if (!didPop) {
      //     final navigator = switch (selectedIndex) {
      //       0 => _homePageNavigatorKey,
      //       1 => _watchListNavigatorKey,
      //       _ => _searchNavigatorKey,
      //     };

      //     final canPop = navigator.currentState!.canPop();

      //     if (canPop) {
      //       navigator.currentState?.pop();
      //     } else {
      //       SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      //     }
      //   }
      // },
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            Navigator(
              key: _homePageNavigatorKey,
              onGenerateRoute: (settings) {
                if (settings.name == '/') {
                  return MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  );
                }
                if (settings.name == Routes.detailsRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieDetailsPage(movie: movie),
                  );
                } else if (settings.name == Routes.movieWebViewRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieWebView(
                      movie: movie,
                    ),
                  );
                }
                return null;
              },
            ),
            Navigator(
              key: _watchListNavigatorKey,
              onGenerateRoute: (settings) {
                if (settings.name == '/') {
                  return MaterialPageRoute(
                    builder: (_) => const WatchListPage(),
                  );
                }
                if (settings.name == Routes.detailsRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieDetailsPage(movie: movie),
                  );
                } else if (settings.name == Routes.movieWebViewRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieWebView(
                      movie: movie,
                    ),
                  );
                }
                return null;
              },
            ),
            Navigator(
              key: _searchNavigatorKey,
              onGenerateRoute: (settings) {
                if (settings.name == '/') {
                  return MaterialPageRoute(
                    builder: (_) => const SearchPage(),
                  );
                }
                if (settings.name == Routes.detailsRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieDetailsPage(movie: movie),
                  );
                } else if (settings.name == Routes.movieWebViewRoute) {
                  final movie = settings.arguments as Movie;
                  return MaterialPageRoute(
                    builder: (_) => MovieWebView(
                      movie: movie,
                    ),
                  );
                }
                return null;
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11.0,
          iconSize: 28.0,
          currentIndex: selectedIndex,
          onTap: onTap,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam,
              ),
              label: "Movies",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: "Watch List"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
        ),
      ),
    );
  }
}
