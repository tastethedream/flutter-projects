import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/details_screen.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Dashboard(),
      routes: {DetailsScreen.routeName: (context) => DetailsScreen()},
    );
  }
}
