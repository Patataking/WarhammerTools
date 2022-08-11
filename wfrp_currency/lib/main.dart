import 'package:flutter/material.dart';

import 'Tabs/currencies_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WFRP 4e',
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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.currency_exchange)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
            title: const Text("WFRP 4e Helper"),
          ),
          body: const TabBarView(
            children: [
              CurrencyTab(title: 'Currency Conversion'),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}

//const MyHomePage(title: 'WFRP 4e Currency Helper'),


