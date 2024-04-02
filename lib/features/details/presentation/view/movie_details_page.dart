import 'package:flutter/material.dart';
import 'package:myflix/features/home/presentation/widgets/movie_list_view.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/dune.jpeg'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cinema Paradiso',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                '1988',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '8.45/10',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'on IMDB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'A film maker recalls his childhood, when he fell in love with the movies at his village\'s theater and formed a deep friendship with the theater\'s projectionist.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'My List',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          MovieListView(
            title: 'Similar Movies',
            size: 18,
          ),
        ],
      ),
    );
  }
}
