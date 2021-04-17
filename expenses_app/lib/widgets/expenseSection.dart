import 'package:flutter/material.dart';
import 'package:expenses_app/data.dart';
import 'package:flutter/painting.dart';
import 'package:expenses_app/widgets/pieChart.dart';

class ExpenseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Expenses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: expenses
                      .map((value) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      pieColors[expenses.indexOf(value)],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  value['name'],
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Expanded(flex: 6, child: PieChart()),
          ],
        ),
      ],
    );
  }
}
