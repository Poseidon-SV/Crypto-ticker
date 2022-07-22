// void main() {
//   int i;
//   for (i = 99; i >= 1; i -= 1) {
//     print("$i bottles of beer on the wall, $i bottles of beer.");
//
//     if (i == 1) {
//       print(
//           "Take one down and pass it around, no more bottles of beer on the wall.");
//     } else {
//       print("Take one down and pass it around, ${i-1} bottles of beer on the wall.");
//     }
//     print("");
//   }
//   print("No more bottles of beer on the wall, no more bottles of beer.\n"
//       "Go to the store and buy some more, 99 bottles of beer on the wall.");
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'coin_data.dart';

/// DropDown Button
//  Container(
//             height: 120.0, alignment: Alignment.center, padding: EdgeInsets.only(bottom: 20.0), color: Colors.lightBlue,
//             child: DropdownButton<String>(
//                 value: selectedCurrency, /// Starting Value
//                 items: [
//                   DropdownMenuItem(
//                     child: Text('USD'),
//                     value: 'USD',
//                   ),
//                   DropdownMenuItem(
//                     child: Text('EUR'),
//                     value: 'EUR',
//                   ),
//                   DropdownMenuItem(
//                     child: Text('GBP'),
//                     value: 'GBP',
//                   ),
//                 ],
//                 onChanged: (value) {
//                   // print(value);
//                   setState(() {
//                     selectedCurrency = value!;
//                   });
//                 }),
//           ),

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';  /// Starting Value
  int currencyCount = currenciesList.length;
  late int currentCount;
  List currency = currenciesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: selectedCurrency,

                /// Starting Value
                items: [ DropdownMenuItem(
                    child: Text('${currency[currentCount]}'),
                    value: 'USD',
                )],
                onChanged: (value) {
                  // print(value);
                  setState(() {
                    selectedCurrency = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}

/// List in FOR
List<String> fruits = [
  "Fru1",
  "Fru2",
  "Fru3",
  "Fru4",
  "Fru5",

];

main(){
  pieMaker();
}

void pieMaker(){
  for (String fruit in fruits){
    print(fruit + "pie");
  }
}

List<int> winningNumbers = [12, 6, 34, 22, 41, 9];



void main2() {

  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];


  checkNumbers(ticket1);
}

void checkNumbers(List<int> myNumbers) {
  //Write your code here.

  int i = 0;

  for (int numW in winningNumbers){
    for (int numT in myNumbers){
      if (numW == numT){
        i++;
      }
    }
  }
  print(i);
}
