import 'package:flutter/material.dart';

class CurrencyTab extends StatefulWidget {
  const CurrencyTab({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CurrencyTab> createState() => _CurrencyTabState();
}

class _CurrencyTabState extends State<CurrencyTab> {
  int _groschenIn = 0;
  int _silberIn = 0;
  int _goldkronenIn = 0;
  String _result = '';
  double _rate = 1.0;

  void _setGroschenIn(text) {
    setState(() {
      _groschenIn = int.parse(text);
    });
  }

  void _setSilberIn(text) {
    setState(() {
      _silberIn = int.parse(text);
    });
  }

  void _setGoldkronenIn(text) {
    setState(() {
      _goldkronenIn = int.parse(text);
    });
  }

  void _setRate(text) {
    setState(() {
      _rate = double.parse(text);
    });
  }

  void _setResult() {
    setState(() {
      int g = _groschenIn;
      int s = _silberIn;
      int gk = _goldkronenIn;

      s = s + gk * 20;
      g = g + s * 12;
      g = (g * _rate).floor();

      s = (g / 12).floor();
      g = g % 12;
      gk = (s / 20).floor();
      s = s % 20;
      _result = '$gk GK $s S $g G';
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Card(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              onChanged: (text) {
                _setGroschenIn(text);
              },
              initialValue: "0",
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Groschen',
              ),
            ),
            TextFormField(
              onChanged: (text) {
                _setSilberIn(text);
              },
              initialValue: "0",
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Silber',
              ),
            ),
            TextFormField(
              onChanged: (text) {
                _setGoldkronenIn(text);
              },
              initialValue: "0",
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Goldkronen',
              ),
            ),
            TextFormField(
              onChanged: (text) {
                _setRate(text);
              },
              initialValue: '$_rate',
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Rate',
              ),
            ),
            Text(
              _result,
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setResult,
        tooltip: 'calc',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
