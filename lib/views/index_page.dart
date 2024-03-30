import 'package:flutter/material.dart';
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

  final List<Widget> _pages = [
    const HomePage(),
    const WatchListPage(),
    const SearchPage()
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
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
    );
  }
}
