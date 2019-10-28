import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'appTheme.dart' as appTheme;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customization Demo',
      theme: appTheme.getTheme(),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

//  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 20,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10));
//          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
//    final bool alreadySaved = _saved.contains(pair);
    final bool alreadySaved = true;

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
//            _saved.remove(pair);
          } else {
//            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I just dont know!"),
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.asset('assets/logo/logo.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
//              onPressed: _pushSaved
            onPressed: null,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Future<String> loadAsset(BuildContext context, key) async {
    return DefaultAssetBundle.of(context).loadString(key);
  }

//  void _pushSaved() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _saved.map(
//            (WordPair pair) {
//              return ListTile(
//                title: Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//
//          final List<Widget> divided = ListTile.divideTiles(
//            context: context,
//            tiles: tiles,
//          ).toList();
//
//          return Scaffold(
//            appBar: AppBar(
//              title: Text('Saved Suggestions'),
//            ),
//            body: ListView(children: divided),
//          );
//        },
//      ),
//    );
//  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
