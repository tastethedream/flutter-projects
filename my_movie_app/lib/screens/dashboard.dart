import 'package:flutter/material.dart';
import 'package:my_movie_app/widgets/horizontal_list.dart';

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
      body: Column(
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HorizontalList(),
                HorizontalList(),
                HorizontalList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
