import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Brat Lash'),
        backgroundColor: Colors.pink[300],
        elevation: 0.0,
        actions: [
          FlatButton.icon(onPressed: () {},
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout', style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
