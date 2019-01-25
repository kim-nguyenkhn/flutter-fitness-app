import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: new ThemeData(primaryColor: Colors.white),
        home: FitnessHome());
  }
}

// TODO: Move this out to a screens/ dir
class FitnessHome extends StatefulWidget {
  @override
  FitnessHomeState createState() => new FitnessHomeState();
}

class FitnessHomeState extends State<FitnessHome> {
  final items = <String>[];
  final checkedItems = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildList());
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;

          if (index >= items.length) {
            items.addAll(['a', 'b', 'c']);
          }

          return _buildRow(items[index]);
        });
  }

  Widget _buildRow(String item) {
    final bool isChecked = checkedItems.contains(item);

    return ListTile(
        title: Text(item),
        leading: new Icon(isChecked ? Icons.favorite : Icons.favorite_border,
            color: isChecked ? Colors.red : null),
        onTap: () {
          setState(() {
            if (isChecked) {
              checkedItems.remove(item);
            } else {
              checkedItems.add(item);
            }
          });
        });
  }
}
