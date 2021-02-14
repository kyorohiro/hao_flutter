import 'package:flutter/material.dart';
https://flutter.dev/docs/cookbook/animation/page-route-animation
void main() {
  runApp(MaterialApp(title: "Flutter layout", home: Page1()));
}

class Page1 extends StatelessWidget  {
  @override
  Widget build(Object context) {
    return Scaffold(appBar: AppBar(),
    body: Center(child: ElevatedButton(child: Text("Go"),onPressed: (){
      print("on ress");
      Navigator.of(context).push(_createRoute());
    },),),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return Page2();
    });
  }
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}