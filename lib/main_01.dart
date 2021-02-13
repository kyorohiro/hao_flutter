import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(MyApp());
}
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() {
    return _RandomWordsState();
  }  
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair> [];
  final _biggerFont = TextStyle(fontSize:  18.0);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return _buildSuggestions();
  }  

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      if(index.isOdd){
        return Divider();
      }
      final i = index~/2;
      if(i >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[i]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
    );
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(Object context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text("Wrlcome to Flutter"),),
        body: Center(child: RandomWords()), 
      )
    );
  }
}

