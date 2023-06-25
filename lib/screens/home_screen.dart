import 'package:flutter_peliculas/providers/movies_provider.dart';
import 'package:flutter_peliculas/search/search_delegate.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    /// print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en cines"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Listado de películas
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Populares
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: "Populares",
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
