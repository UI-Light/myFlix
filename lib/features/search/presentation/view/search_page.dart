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
  TextEditingController controller = TextEditingController();
  SearchViewModel searchViewModel = SearchViewModel();

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    searchViewModel.searchMovies(controller.text);
  }

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
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                      color: Colors.grey[900],
                    ),
                    child: TextFormField(
                      controller: controller,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        _debouncer.run(() {
                          searchViewModel.searchMovies(value);
                        });

                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        suffixIcon: controller.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  controller.clear();
                                  searchViewModel.searchMovies(controller.text);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.red[900],
                    )),
              ),
              ValueListenableBuilder(
                  valueListenable: searchViewModel.isLoading,
                  builder: (context, isLoading, _) {
                    return isLoading
                        ? Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.red[900]),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ValueListenableBuilder(
                                valueListenable: searchViewModel.searchresults,
                                builder: (context, movies, _) {
                                  return movies.isEmpty
                                      ? Center(
                                          child: Text(
                                            'Could not find movie "${controller.text}"',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : GridView.builder(
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
                                          itemCount: movies.length,
                                          itemBuilder: (context, index) {
                                            return MovieCard(
                                                movie: movies[index]);
                                          },
                                        );
                                }),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
