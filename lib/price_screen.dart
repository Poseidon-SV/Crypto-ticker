import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

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
/// FOR Loop
/// FOR-IN Loop for List
/// Check 99_Bottles_of_Beer.dart
/// Building Platform Specific UI (iOS &
/// Procedure for getting data from an Future Class(json formatted file)

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  /// S1.
  String selectedCurrency = currenciesList[0];


  /// Starting Value

  List<DropdownMenuItem<String>> getDropdownItems() {
    /// Their's an another method
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  ///  List<DropdownMenuItem<String>> getDropdownItems() { /// Their's an another method
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (String currency in currenciesList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//
//       dropdownItems.add(newItem);
//     }
//     return dropdownItems;
//   }

  List<Widget> getScrollItems() {
    List<Widget> scrollItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      scrollItems.add(newItem);
    }
    return scrollItems;
  }

  DropdownButton<String> andriodDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }
    int index;

    return DropdownButton<String>(
        value: selectedCurrency,

        /// Starting Value
        items: dropdownItems,
        onChanged: (value) {
          // print(value);
          setState(() {
            selectedCurrency = value!;
            getData();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Widget> scrollItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      scrollItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,

      ///Apple
      itemExtent: 32,
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          /// 2S> setState for picker value
          selectedCurrency = currenciesList[selectedIndex];

          /// 3S>
          getData();
        });
      },
      children: scrollItems,
    );
  }

  /// Procedure for getting data from an Future Class(json formatted file)
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  String bitcoinValue = '...';
  String ethcoinValue = '...';
  String ltccoinValue = '...';

  void getData() async {
    try {
      /// 4S>
      double data = await CoinData().getcoinData(selectedCurrency);
      setState(() {
        bitcoinValue = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
    try {
      /// 4S>
      double data = await CoinData().ETHgetcoinData(selectedCurrency);
      setState(() {
        ethcoinValue = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
    try {
      /// 4S>
      double data = await CoinData().LTCgetcoinData(selectedCurrency);
      setState(() {
        ltccoinValue = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      /// 5S> set currency for the value
                      '1 BTC = $bitcoinValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      /// 5S> set currency for the value
                      '1 ETH = $ethcoinValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      /// 5S> set currency for the value
                      '1 LTC = $ltccoinValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.lightBlue,

            /// child: Platform.isIOS ? iOSPicker() : andriodDropDown()
            // child: iOSPicker(),
            child: andriodDropDown(),
            // DropdownButton<String>(
            //     value: selectedCurrency,
            //
            //     /// Starting Value
            //     items:
            //     // [
            //       // DropdownMenuItem(
            //       //   child: Text('USD'),
            //       //   value: 'USD',
            //       // ),
            //       // DropdownMenuItem(
            //       //   child: Text('EUR'),
            //       //   value: 'EUR',
            //       // ),
            //
            //     // ],
            ///     getDropdownItems(),
            //     onChanged: (value) {
            //       // print(value);
            //       setState(() {
            //         selectedCurrency = value!;
            //       });
            //     }),
            //     CupertinoPicker(
            //   backgroundColor: Colors.lightBlue,
            //
            //   ///Apple
            //   itemExtent: 32,
            //   onSelectedItemChanged: (selectedIndex) {
            //     print(selectedIndex);
            //   },
            //   children: getScrollItems(),
            //   // [
            //   //   Text('USD'),
            //   //   Text('EUR'),
            //   //   Text('GRD'),
            //   //   Text('USD'),
            //   //   Text('EUR'),
            //   //   Text('GRD'),
            //   //   Text('USD'),
            //   // ],
            // ),
          ),
        ],
      ),
    );
  }
}
