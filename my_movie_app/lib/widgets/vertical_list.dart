import 'package:flutter/material.dart';

class VerticalList extends StatelessWidget {
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
                    image: AssetImage('assets/images/test.jpeg'),
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
                      'Another Nice Plant',
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
                      child: Text(
                          'Plants are green, they give us oxygen  and generally look pretty nice.'),
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
