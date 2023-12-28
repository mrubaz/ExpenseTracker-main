import 'package:expensetracker/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'widgets/const.dart';

void main() {
  runApp(const ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: customGreen,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
