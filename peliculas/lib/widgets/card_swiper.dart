import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  
  const CardSwiper({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(this.movies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.60,
        itemHeight: size.height * 0.40,
        itemBuilder: (BuildContext context, int index){

          final movie = movies[index];

          print(movie.posterPath);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
