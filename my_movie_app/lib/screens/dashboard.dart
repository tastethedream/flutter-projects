import 'package:flutter/material.dart';
import 'package:my_movie_app/widgets/horizontal_list_item.dart';
import 'package:my_movie_app/widgets/top_rated_list_item.dart';
import 'package:my_movie_app/widgets/vertical_list_item.dart';
import 'package:my_movie_app/models/movie.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View'),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 280.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => HorizontalListItem(i),
                // children: [
                //   HorizontalList(),
                //   HorizontalList(),
                //   HorizontalList(),
                // ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Of 2021',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View'),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bestMovieList.length,
                itemBuilder: (ctx, i) => VerticalListItem(i),
                //   children: [
                //     VerticalList(),
                //     VerticalList(),
                //     VerticalList(),
                // ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View'),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 280.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedMovieList.length,
                itemBuilder: (ctx, i) => TopRatedListItem(i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
