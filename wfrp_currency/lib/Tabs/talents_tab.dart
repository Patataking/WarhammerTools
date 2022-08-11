import 'package:flutter/material.dart';

import 'resources/talents.dart';

class TalentTab extends StatefulWidget {
  const TalentTab({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TalentTab> createState() => _TalentTabState();
}

class _TalentTabState extends State<TalentTab> {
  final List<Map<String, dynamic>> _allTalents = talents;

  List<Map<String, dynamic>> _filteredTalents = [];

  @override
  initState() {
    _filteredTalents = _allTalents;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allTalents;
    } else {
      results = _allTalents
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _filteredTalents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _filteredTalents.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredTalents.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_filteredTalents[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ExpansionTile(
                            title: Text(_filteredTalents[index]['name']),
                            subtitle: Text(
                                "Maximum: ${_filteredTalents[index]['maximum']}"),
                            children: [
                              Column(
                                children: [
                                  if (_filteredTalents[index][
                                          'rolls'] // TODO: Find out how to use one expression
                                      .toString()
                                      .isNotEmpty)
                                    const Text("Würfe:"),
                                  if (_filteredTalents[index]['rolls']
                                      .toString()
                                      .isNotEmpty)
                                    Text(_filteredTalents[index]['rolls']
                                        .toString()),
                                  if (_filteredTalents[index]['rolls']
                                      .toString()
                                      .isNotEmpty)
                                    const SizedBox(height: 10),
                                  Text(_filteredTalents[index]['description'])
                                ],
                              )
                            ]),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
