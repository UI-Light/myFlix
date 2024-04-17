import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'My Watch List',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
