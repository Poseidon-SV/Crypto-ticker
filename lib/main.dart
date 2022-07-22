import 'package:flutter/material.dart';
import 'price_screen.dart';

/// price_screen
    /// DropDown Button
    /// Building Widget with Loops
    /// Building Platform Specific UI (iOS & Android)
    /// Procedure for getting data from an Future Class(json formatted file)
/// /// Check 99_Bottles_of_Beer.dart for FOR Loops

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      title: 'Crypto Ticker',
      home: PriceScreen(),
    );
  }
}
