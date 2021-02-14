import 'package:flutter/material.dart';

// https://flutter.dev/docs/cookbook/animation/physics-simulation

void main() {
  runApp(MaterialApp(title: "Flutter layout", home: PhysicsCardsDragDemo()));
}

class PhysicsCardsDragDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});
  @override
  State<StatefulWidget> createState() {
    return DraggableCardState();
  }
  
}

class DraggableCardState extends State<DraggableCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child:  Card(child:  widget.child),
    );
  }
  
}