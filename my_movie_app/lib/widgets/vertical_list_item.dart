import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';

class VerticalListItem extends StatelessWidget {
  final int index;
  VerticalListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(bestMovieList[index].imageUrl),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bestMovieList[index].title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 240.0,
                      child: Text(bestMovieList[index].description),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
