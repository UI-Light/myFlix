import 'package:flutter/material.dart';

class MovieBox extends StatefulWidget {
  const MovieBox({super.key});

  @override
  State<MovieBox> createState() => _MovieBoxState();
}

class _MovieBoxState extends State<MovieBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
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
