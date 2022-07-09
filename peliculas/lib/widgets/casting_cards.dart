import 'package:flutter/cupertino.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData){
        return  Container(
          constraints: const BoxConstraints(maxWidth: 150),
          height: 180,
          child: const CupertinoActivityIndicator(),
        );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          // color: Colors.red,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (BuildContext context, int index) =>
                  _CastCard(actor: cast[index])),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
