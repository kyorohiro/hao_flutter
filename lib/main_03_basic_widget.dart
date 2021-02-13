import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
      title: "My App",
      home: SafeArea(
        child: MyScaffold(),
      )));
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
              title: Text(
            "Example title",
            style: Theme.of(context).primaryTextTheme.headline6,
          )),
          Expanded(
            child: Center(
              child: Text("Hello, World!!"),
            ),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Widget title;
  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.menu),
              tooltip: "Navigation menu",
              onPressed: () {
                print("on press");
              }),
          Expanded(child: Center(child: title)),
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                print("on press search");
              })
        ],
      ),
    );
  }
}
