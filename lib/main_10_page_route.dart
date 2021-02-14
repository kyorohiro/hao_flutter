import 'package:flutter/material.dart';

// https://flutter.dev/docs/cookbook/animation/page-route-animation
void main() {
  runApp(MaterialApp(title: "Flutter layout", home: Page1()));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text("Go"),
          onPressed: () {
            print("on ress");
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Page2();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.5, 0.5);
        var end = Offset(0.0, 0.0);
       // var tween = Tween(begin: begin, end: end);
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));

        //var offsetAnimation = animation.drive(tween);
        //return SlideTransition(position: offsetAnimation, child: child,);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
/*
      var curveAnimation = CurvedAnimation(parent: animation, curve: Curves.ease);
      return SlideTransition(
        position: tween.animate(curveAnimation), //
        child: child//
        );
      */
      },
    );
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
