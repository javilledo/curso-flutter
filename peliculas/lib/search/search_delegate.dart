import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '' , 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // El segundo valor es para lo que se devolverá a la instancia en HomeScreen
      },
      icon: const Icon(Icons.arrow_back)
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(width: 100, color: Colors.green,);
  }

  Widget _emptyContainer(){
    return const Center(
      child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130,),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty){
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);
    

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {

        final movies = snapshot.data;

        if (!snapshot.hasData) return _emptyContainer();
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (BuildContext context, int index) {
            return _MovieItem(movie: movies[index]);
          },
        );
      },
    );

  }

}

class _MovieItem extends StatelessWidget {

  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}