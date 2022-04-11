import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Conversion(),
    );
  }
}

class Conversion extends StatefulWidget {
  const Conversion({Key? key}) : super(key: key);

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  double userValue = 0;

  var currency = [
    "Dollar",
    "Renminbi",
    "Ruble",
    "Yen",
    "Euro",
    "Real",
    "Rupees",
    "Peso",
    "Canadian Dollar"
  ];

  var convertRate = [1.0, 6.40, 71.5, 114.13, 0.86, 5.68, 74.86, 20.84, 1.24];

  String currentCurrency = "Dollar";
  String convertTo = "Dollar";

  int currentIndex = 0;
  int convertedIndex = 0;

  String convertedValue = "";

  double newVal = 0.00;

  String sNewVal = "";

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Conversion'),
      ),
      body: Column(
        children: [
          Form(
              child: TextFormField(
            controller: _textFieldController,
          )),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              DropdownButton(
                // Initial Value
                value: currentCurrency,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: currency.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    print(newValue);
                    currentCurrency = newValue!;
                  });
                },
              ),
              DropdownButton(
                // Initial Value
                value: convertTo,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: currency.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    convertTo = newValue!;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  userValue = double.parse(_textFieldController.text);
                  currentIndex = currency.indexOf(currentCurrency);
                  convertedIndex = currency.indexOf(convertTo);

                  newVal = userValue /
                      convertRate[currentIndex] *
                      convertRate[convertedIndex];

                  sNewVal = newVal.toStringAsFixed(2);
                });
              },
              child: const Text("Convert")),
          Text(
            '$currentCurrency : $userValue \n $convertTo : $sNewVal',
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}



/**
 * 
 *           DropdownButton(
            // Initial Value
            value: "Dollar",

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: currency.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                currentCurrency = newValue!;
              });
            },
          ),
          DropdownButton(
            // Initial Value
            value: "Dollar",

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: currency.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                currentCurrency = newValue!;
              });
            },
          ),
 * 
 */