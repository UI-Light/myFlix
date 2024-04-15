import 'package:flutter/material.dart';
import 'package:myflix/core/presentation/widgets/movie_card.dart';
import 'package:myflix/core/utils/debouncer_util.dart';
import 'package:myflix/features/search/presentation/view_model/search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchViewModel searchViewModel = SearchViewModel();
  TextEditingController controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                      color: Colors.grey[900],
                    ),
                    child: TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        _debouncer.run(() {
                          searchViewModel.searchMovie(value);
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: InputBorder.none,
                      ),
                    )),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: searchViewModel.searchresults,
                    builder: (context, movies, _) {
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3 / 4,
                          mainAxisSpacing: 4,
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
