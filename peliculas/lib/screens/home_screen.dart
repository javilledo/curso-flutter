import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (() => showSearch(context: context, delegate: MovieSearchDelegate())), icon: const Icon(Icons.search_outlined))
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Tarjetas principales
              CardSwiper( movies: moviesProvider.onDisplayMovies),

              // Slider de películas
              MovieSlider( 
                movies: moviesProvider.popularMovies,
                title: 'Populares', //opcional
                onNextPage: () => moviesProvider.getPopularMovies()
              ),

            ],
          ),
        ),
      ),
    );
  }
}
