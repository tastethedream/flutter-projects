import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';

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
          Card(
            elevation: 10,
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
