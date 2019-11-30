import 'package:flutter/material.dart';
import 'package:wasterage/homescreen.dart';

void main() => runApp(Wasterage());

class Wasterage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
