import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/screens/details_screen.dart';

class TopRatedListItem extends StatelessWidget {
  final int index;
  TopRatedListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160.0,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                arguments: {
                  'id': topRatedMovieList[index].id,
                  'title': topRatedMovieList[index].title,
                  'imageUrl': topRatedMovieList[index].imageUrl,
                  'description': topRatedMovieList[index].description,
                  'rating': topRatedMovieList[index].rating,
                  'year': topRatedMovieList[index].year,
                  'duration': topRatedMovieList[index].duration,
                },
              );
            },
            child: Card(
              elevation: 10,
              child: Hero(
                tag: topRatedMovieList[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(topRatedMovieList[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            topRatedMovieList[index].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
