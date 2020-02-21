import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Slidable Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<_HomeItem> items = List.generate(
    5,
    (i) => _HomeItem(
      i,
      'Tile n°$i',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateX(2),
        tooltip: "Do something",
        child: Icon(Icons.add),
      ),
    );
  }

  _updateX(int x) {
    setState(() {
      print('updating');
      items[x].title = items[x].title == "Hallo Welt!"
          ? "$x"
          : items[x].title = "Hallo Welt!";
    });
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Tile(items[index], _deleteItem, ObjectKey(items[index]));
      },
      itemCount: items.length,
    );
  }

  void _deleteItem(_HomeItem item) {
//    setState(() {
//      items.remove(item);
//    });
  }
}

class Tile extends StatefulWidget {
  final _HomeItem item;
  final Function delete;
  final Key key; // This key enables the ui to update the right way when
  // an item from the list is removed.

  Tile(this.item, this.delete, this.key);

  @override
  State<StatefulWidget> createState() => _TileState(item, delete);
}

class _TileState extends State<Tile> {
  final _HomeItem item;
  final Function delete;

  _TileState(this.item, this.delete);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(item.index),
      title: Text("${item.title}"),
      subtitle: Text("${item.index}"),
      onTap: () => delete(item),
    );
  }
}

class _HomeItem {
  _HomeItem(
    this.index,
    this.title,
  );

  final int index;
  String title;
}
