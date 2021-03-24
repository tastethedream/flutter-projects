import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final id = routeArgs['id'];
    final rating = routeArgs['rating'];

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        //title: Text('Movie Details'),
        backgroundColor: Color(0xfff44f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 5.0,
                child: Hero(
                  tag: id,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          routeArgs['imageUrl'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              routeArgs['title'],
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          routeArgs['duration'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          routeArgs['year'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          routeArgs['rating'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              routeArgs['description'],
              style: TextStyle(
                fontSize: 18.0,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: RaisedButton(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20.0,
                ),
                onPressed: () {},
                color: Colors.teal,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_outline),
                    Container(
                      height: 5.0,
                      width: 5.0,
                    ),
                    Text(
                      'Watch Trailer',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: RaisedButton(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20.0,
                ),
                onPressed: () {},
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                    ),
                    Container(
                      height: 5.0,
                      width: 5.0,
                    ),
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
