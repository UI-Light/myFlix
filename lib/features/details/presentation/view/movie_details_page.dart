import 'package:flutter/material.dart';
import 'package:myflix/features/details/presentation/widgets/similar_movies_list.dart';

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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              children: [
                const Text(
                  'Cinema Paradiso',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16),
                    text: '1998 ',
                    children: [
                      const TextSpan(
                          text: ' • ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: ' 8.45/10',
                          style: TextStyle(color: Colors.red[900])),
                      const TextSpan(text: '  on IMDB'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'A film maker recalls his childhood, when he fell in love with the movies at his village\'s theater and formed a deep friendship with the theater\'s projectionist.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
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
                  ),
                ),
                const SizedBox(height: 20),
                const SimilarMoviesListView(title: 'Similar Movies'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
