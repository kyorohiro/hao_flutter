import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Flutter Tutorial", home: TutorialHome()));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example title"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Menu",
            onPressed: () {
              print("on press menu");
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                print("on press search");
              })
        ],
      ),
      body: Center(
        child: Text("Hello, World!!"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add",
        child: Icon(Icons.add),
        onPressed: () {
          print("on press add");
        },
      ),
    );
  }
}

