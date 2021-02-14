import 'package:flutter/material.dart';
// https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
void main() {
  runApp(MaterialApp(title: "Flutter layout", home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), //
        body: //
            Center(
          //
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text("View Details"),
            onPressed: () {
              print("on pressed ..");
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen();
              }));
            },
          ),
        ));
    // Text("Hello, World!!");
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Center(
      child: TextButton(child: Text("Pop!"),onPressed: (){
        Navigator.pop(context);
      },),
    ),);
  }
  
}