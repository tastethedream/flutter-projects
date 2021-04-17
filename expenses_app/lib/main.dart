import 'package:expenses_app/data.dart';
import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/cardSection.dart';
import 'widgets/expenseSection.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular'),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColour,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 120,
              child: WalletHeader(),
            ),
            Expanded(child: CardSection()),
            Expanded(child: ExpenseSection()),
          ],
        ),
      ),
    );
  }
}
