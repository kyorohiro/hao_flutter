import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
// https://flutter.dev/docs/cookbook/animation/physics-simulation

void main() {
  runApp(MaterialApp(title: "Flutter layout", home: PhysicsCardsDragDemo()));
}

class PhysicsCardsDragDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
      DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
      DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),

      ],)

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

class DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cont = Align(
      alignment: _dragAlignment,
      child: Card(child: widget.child),
    );

    var ges = GestureDetector(
      onPanDown: (details) {
        print("onPanDown");
      },
      onPanUpdate: (details) {
        setState(() {
         // print("update ${details.delta.dx}:${details.delta.dy}");
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        print("onPanEnd ${details.velocity.pixelsPerSecond}:${size}");
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: cont,
    );
    return ges;
  }

  Animation<Alignment> _animation;
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);

  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        print("--");
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
